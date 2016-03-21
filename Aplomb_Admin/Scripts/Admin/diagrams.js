$(function () {
    $('#nodeEdit').blur(checkInput);

    $('#diagram').click(function () {
        checkInput();
        remClass($('#diagram g.node.selected'), 'selected');
        currentNode = null;
        $('#nodeEdit').val('');
    });

    $('#btnNew').click(function () {
        var name = prompt("Enter a name for the new entity type");
        if (isNameUsed(name))
        {
            alert('This name is already used by another entity type.')
            return;
        }

        new Node(name, 'cccccc', 100, 100);
    });

    $('#btnDelete').click(function () { if (currentNode !== null && confirm("Delete selected node?")) deleteCurrentNode(); return false; });
    
    $('#nodeView').on('click', '.link', function (event) { openLookup($(event.currentTarget).text()) });
});

/*
function closeEditorWarning() {
    return 'Ensure that you save your changes before quitting.'
}
window.onbeforeunload = closeEditorWarning;
*/

var editMode = true;
var nextElementID = 1;
var allNodes = {};
var allLookups = {};

function Link(from, to) {
    this.fromNode = from;
    this.toNode = to;
    this.elementID = 'line' + (nextElementID++);
    this.text = null;
}

function Node(name, color, x, y, id) {
    this.name = name;
    if (x === undefined)
        x = Math.floor((Math.random() * 480) + 10);
    if (y === undefined)
        y = Math.floor((Math.random() * 480) + 10);
    this.x = x; this.y = y;
    this.color = color;
    this.elementID = 'node' + (nextElementID++);
    this.entityID = id;

    this.outgoingLinks = [];
    this.incomingLinks = [];

    allNodes[name] = this;
    updateNodeImage(this);
}

function isNameUsed(name) {
    if (allNodes.hasOwnProperty(name))
        return true;

    if ($('#existingTypes option[value="' + name + '"]').length > 0)
        return true;

    return false;
}

var currentNode = null;

function nodeSelected(element) {
    var clickedNode = null;
    var elementID = element.getAttribute('id');

    // find selected node
    for (var name in allNodes) {
        var node = allNodes[name];
        if (node.elementID == elementID) {
            clickedNode = node;
            break;
        }
    }

    if (clickedNode == null || clickedNode == currentNode)
        return;

    checkInput();
    currentNode = clickedNode;

    remClass($('#diagram g.node.selected'), 'selected');
    addClass(element, 'selected');

    // remove element from DOM and re-add it, because SVG z-index is based on element order
    var parent = element.parentNode;
    parent.removeChild(element);
    parent.appendChild(element);

    var editor = $('#nodeEdit');
    editor.val(currentNode.editText);
    editor.focus();

    var viewer = $('#nodeView');
    viewer.html(currentNode.viewText);
}

function checkInput() {
/*
    if (currentNode.name != name) {
        delete allNodes[currentNode.name];
        currentNode.name = name;
        allNodes[currentNode.name] = currentNode;
        updateNodeImage(currentNode);
    }
    currentNode.editText = rawInput;
    currentNode.viewText = calculateView(rawInput);

    updateLinks(currentNode, otherTypeIDs);
*/
    currentNode = null;
    remClass($('#diagram g.node.selected'), 'selected');
}

function updateLinks(node, lines) {
    var previousLinks = node.outgoingLinks;
    node.outgoingLinks = [];

    for (var i = 1; i < lines.length; i++) {
        var line = lines[i];
        if (line.length > 1 && line.substr(0, 1) == '#') {
            var lineContent = line.substr(1).trim();
            if (lineContent == '')
                continue;

            var destinationName = lineContent;
            var linkText = null;
            var separator = lineContent.indexOf('#')
            if (separator != -1) {
                destinationName = lineContent.substr(0, separator).trim();
                linkText = lineContent.substr(separator + 1).trim();
                if (destinationName == '')
                    continue;
                if (linkText == '')
                    linkText = null;
            }

            var destinationNode;
            if (allNodes.hasOwnProperty(destinationName))
                destinationNode = allNodes[destinationName];
            else
                destinationNode = new Node(destinationName, destinationName + '\r\n\r\n');

            var link = $.grep(previousLinks, function (l) { return l.toNode == destinationNode; });
            if (link.length == 0) {
                link = new Link(node, destinationNode);
                destinationNode.incomingLinks.push(link);
            }
            else {
                link = link[0];
                arrayRemoveItem(previousLinks, link);
            }
            link.text = linkText;
            node.outgoingLinks.push(link);
        }
    }

    for (var i = 0; i < node.outgoingLinks.length; i++) {
        var link = node.outgoingLinks[i];
        updateLine(link);
        updateLinkText(link);
    }
    for (var i = 0; i < previousLinks.length; i++) {
        var link = previousLinks[i];
        deleteLine(link);
        arrayRemoveItem(link.toNode.incomingLinks, link);
    }
}

function updateNodeImage(node) {
    var group = $('#' + node.elementID);
    if (group.length == 0) {
        var group = $(SVG('g'))
			.attr('class', 'node')
			.attr('id', node.elementID)
			.attr('transform', 'translate(' + node.x + ' ' + node.y + ')') // set x & y
			.appendTo($('#diagram'));

        var rect = $(SVG('rect'))
			.appendTo(group);

        $(SVG('text')).appendTo(group);
        group.mousedown(dragStart)
			.click(function (e) { e.stopPropagation(); });
    }

    var textNode = group.children('text')
    textNode.text(node.name);

    var bbox = textNode.get(0).getBBox();

    textNode.attr('transform', 'translate(-' + (bbox.width / 2) + ' ' + (bbox.height / 3) + ')');

    group.children('rect') // recalculate size of rectangle?
		.attr('width', bbox.width + 10)
		.attr('height', bbox.height + 2)
		.attr('transform', 'translate(-' + (bbox.width / 2 + 5) + ' -' + (bbox.height / 2) + ')');
}

function updateLine(link) {
    var line = $('#' + link.elementID);
    if (line.length == 0) {
        line = $(SVG('path'))
			.attr('class', 'link plain')
			.attr('id', link.elementID)
			.prependTo($('#diagram'));
    }

    var leftward = link.fromNode.x > link.toNode.x;
    var leftNode = leftward ? link.toNode : link.fromNode;
    var rightNode = leftward ? link.fromNode : link.toNode;

    // set x & y of each end
    line.attr('d', 'M' + leftNode.x + ' ' + leftNode.y + ' L' + rightNode.x + ' ' + rightNode.y + ' Z');
}

function updateLinkText(link) {
    var textElem = $('#' + link.elementID + '_text');

    if (link.text == null) {
        textElem.remove();
        return;
    }

    var textPath;
    if (textElem.length == 0) {
        textElem = $(SVG('text'))
			.attr('class', 'link')
			.attr('id', link.elementID + '_text')
			.attr('text-anchor', 'middle')
			.prependTo($('#diagram'));

        textPath = $(SVG('textPath'))
			.appendTo(textElem);
        textPath[0].setAttribute('startOffset', '25%');
        textPath[0].setAttributeNS('http://www.w3.org/1999/xlink', 'href', '#' + link.elementID);
    }
    else
        textPath = textElem.children();

    textPath.text(link.text);
}

function deleteNodeImage(node) {
    $('#' + node.elementID).remove();
}

function deleteLine(link) {
    $('#' + link.elementID).remove();
    $('#' + link.elementID + '_text').remove();
}

function SVG(tag) {
    return document.createElementNS('http://www.w3.org/2000/svg', tag);
}

function addClass(elem, className) {
    var classNameSpaced = ' ' + className + ' ';
    var classes = elem.getAttribute('class');
    var spaced = ' ' + classes + ' ';
    if (spaced.indexOf(classNameSpaced) != -1)
        return;
    elem.setAttribute('class', classes + ' ' + className);
}

function remClass(elems, className) {
    var spaced = ' ' + className + ' ';
    elems.each(function () {
        var classes = ' ' + this.getAttribute('class') + ' ';
        if (classes.indexOf(spaced) == -1)
            return;
        this.setAttribute('class', classes.replace(spaced, ' ').trim());
    });
}

function arrayIndexOf(array, item) {
    if (typeof Array.prototype.indexOf == "function")
        return Array.prototype.indexOf.call(array, item);
    for (var i = 0, j = array.length; i < j; i++)
        if (array[i] === item)
            return i;
    return -1;
}

function arrayRemoveItem(array, itemToRemove) {
    var index = arrayIndexOf(array, itemToRemove);
    if (index >= 0) {
        array.splice(index, 1);
        return true;
    }
    return false;
};


var dx = 0;
var dy = 0;
function dragStart(e) {
    nodeSelected(this);

    dx = e.offsetX - currentNode.x;
    dy = e.offsetY - currentNode.y;

    $('#diagram')
		.on('mousemove', dragMove)
		.on('mouseout', dragStop)
		.on('mouseup', dragStop);
}

function dragMove(e) {
    if (currentNode == null)
        return;

    var x = e.offsetX - dx;
    var y = e.offsetY - dy;

    currentNode.x = x; currentNode.y = y;
    $('#' + currentNode.elementID).attr('transform', 'translate(' + x + ' ' + y + ')');

    for (var i = 0; i < currentNode.incomingLinks.length; i++)
        updateLine(currentNode.incomingLinks[i]);
    for (var i = 0; i < currentNode.outgoingLinks.length; i++)
        updateLine(currentNode.outgoingLinks[i]);
}

function dragStop(evt) {
    $('#diagram')
		.off('mousemove', dragMove)
		.off('mouseout', dragStop)
		.off('mouseup', dragStop);
}

function checkSaved() {
    // adding a "new" type asks for the name, then just adds it with no extra info.

    // clicking "into" a type to edit it requires that the form has first been saved.

    // change "save" button into a "save and close" button, and add a new "save" button that doesn't leave the current form. (Ajax save?)
    return true;
}

function saveDiagram() {
    var layout = [];

    for (var name in allNodes) {
        var node = allNodes[name];

        layout.push({
            ID: node.entityID,
            Name: node.name,
            X: node.x,
            Y: node.y,
            Color: node.color
        });
    }

    $('#layout').val(JSON.stringify(layout));
    return true;
}

function loadData(doc) {
    allNodes = {};
    allLookups = {};
    nextElementID = 1;
    $('#nodeEdit').val('');
    $('#diagram').html('');
    currentNode = null;

    var first = true;
    doc.children().each(function () {
        var element = $(this);

        if (first) {
            first = false;
            if (element.get(0).nodeName.toLowerCase() == 'lookups') {
                element.children().each(function () {
                    var child = $(this);
                    addNewLookup(child.attr('name'), child.text());
                });
                return;
            }
        }

        var x = element.attr('x');
        var y = element.attr('y');
        var text = element.text();

        var lines = text.split(/\r?\n/);
        var name = lines[0].trim();
        var node = new Node(name, text, x, y);
        allNodes[name] = node;
    });

    for (var name in allNodes) {
        var node = allNodes[name];
        var lines = node.editText.split(/\r?\n/);
        updateLinks(node, lines);
    }
}

function deleteCurrentNode() {
    // delete all incoming and outgoing links to this node
    for (var i = 0; i < currentNode.outgoingLinks.length; i++) {
        var link = currentNode.outgoingLinks[i];
        deleteLine(link);
        arrayRemoveItem(link.toNode.incomingLinks, link);
    }
    for (var i = 0; i < currentNode.incomingLinks.length; i++) {
        var link = currentNode.incomingLinks[i];
        deleteLine(link);
        arrayRemoveItem(link.fromNode.outgoingLinks, link);
    }

    delete allNodes[currentNode.name];
    deleteNodeImage(currentNode);

    currentNode = null;
    $('#nodeEdit').val('');
}