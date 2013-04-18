function LifeTorus(size) {
    this.size = size;
    var count = size * size;
    this.torus = new Array(count);

    this.clear = function() {
        for (var i = 0; i < count; i++)
            this.torus[i] = 0;// 0 means empty for convenience and speed
    };

    // returns count of the number of neighbours of each kind
    this.getNeighbours = function(x, y) {
        var count = [0, 0, 0, 0, 0];
        // prev row
        count[this.get(x - 1, y - 1)]++;
        count[this.get(x, y - 1)]++;
        count[this.get(x + 1, y - 1)]++;

        // this row
        count[this.get(x - 1, y)]++;
        count[this.get(x + 1, y)]++;

        // next row
        count[this.get(x - 1, y + 1)]++;
        count[this.get(x, y + 1)]++;
        count[this.get(x + 1, y + 1)]++;

        return count;
    };

    this.get = function(x, y) {
        return this.torus[this.getIndex(x, y)];
    };

    this.set = function(x, y, value) {
        this.torus[this.getIndex(x, y)] = value;
    };

    // Treats the two dimensional arreay as a torus, i.e.
    // the top and bottom edges of the array are adjacent and the left and right edges
    // are adjacent.
    this.getIndex = function(x, y) {
        if (x < -1 || y < -1 || x > size || y > size)
            throw "Index out of bounds";
        if (x == -1)
            x = size - 1;
        else if (x == size)
            x = 0;
        if (y == -1)
            y = size - 1;
        else if (y == size)
            y = 0;
        return x + y * this.size;
    };

    this.clear();
}

function relMouseCoords(event) {
    var totalOffsetX = 0;
    var totalOffsetY = 0;
    var canvasX = 0;
    var canvasY = 0;
    var currentElement = this;

    do {
        totalOffsetX += currentElement.offsetLeft;
        totalOffsetY += currentElement.offsetTop;
    }
    while (currentElement = currentElement.offsetParent)

    canvasX = event.pageX - totalOffsetX;
    canvasY = event.pageY - totalOffsetY;

    return {x: canvasX, y: canvasY}
}
HTMLCanvasElement.prototype.relMouseCoords = relMouseCoords;



