// Keep a torus for the current and next generation
var _size = 64;
var _cellSize = 10;
var _torus1 = new LifeTorus(_size);
var _torus2 = new LifeTorus(_size);
var _animate = false;
var _generation = 0;
var isMouseDown = false;

function clearGame() {
    _torus1.clear();
    _generation = 0;
    generation.textContent = "Generation: 0";
    render();
    updatePopulation();
}

function animate() {
    _animate = !_animate;
    if (_animate) {
        advance();
        btnAnimate.textContent = "Stop";
    } else {
        btnAnimate.textContent = "Animate";
    }
}

function advance() {
    // torus1 contains the current model, process into torus2 then swap the
    // references so torus1 refers to the next generation
    var _population = 0;
    for (var x = 0; x < _size; x++)
        for (var y = 0; y < _size; y++) {
            var neighbours = _torus1.getNeighbours(x, y);// dim 5 array
            var alive = 0;
            var kind = _torus1.get(x, y);
            if (kind > 0) {
                // its alive - it will stay alive if it has 2 or 3 neighbours
                var count = neighbours[kind];
                alive = (count == 2 || count == 3) ? kind : 0;
            }
            else {
                // Its dead but will be born if any "kind" has exactly 3 neighbours
                // This isn't "fair" but we use the first kind that has three neightbours
                for (kind = 1; kind <= 4 && alive == 0; kind++) {
                    if (neighbours[kind] == 3)
                        alive = kind;
                }
            }
            _torus2.set(x, y, alive);
            if (alive)
                _population++;
        }

    var temp = _torus1; // arrays are only references!
    _torus1 = _torus2;
    _torus2 = temp;
    render();
    generation.textContent = "Generation: " + String(++_generation);
    population.textContent = "Population: " + String(_population);
    if (_animate)
        setTimeout("advance()", 50);
}

function renderCanvas(canvas, size, torus) {
    // read from LifeTorus and write to canvas
    var context = canvas.getContext('2d');
    context.fillStyle = '#ff7f50';
    context.clearRect(0, 0, size * _cellSize, size * _cellSize);
    for (var x = 0; x < size; x++)
        for (var y = 0; y < size; y++) {
            var kind = _torus1.get(x, y) - 1;
            if (kind >= 0) {
                context.fillStyle = color_menu0.options[kind].value;
                context.fillRect(x * _cellSize, y * _cellSize, _cellSize, _cellSize);
            }
        }
}

function render() {
    renderCanvas(canvas1, _size, _torus1);
}

function drawGrid() {
    // Only ever called once!
    var context = canvas2.getContext('2d'); // canvas2 is the background canvas
    context.strokeStyle = '#808080';
    context.beginPath();
    for (var i = 0; i <= _size; i++) {
        // Draw vertical lines
        context.moveTo(i * _cellSize + 0.5, 0.5);
        context.lineTo(i * _cellSize + 0.5, _size * _cellSize);
        // Draw horizontal lines
        context.moveTo(0.5, i * _cellSize + 0.5);
        context.lineTo(_size * _cellSize, i * _cellSize + 0.5);
    }
    context.stroke();
}


function setPoint(x, y) {
    // convert to torus coords
    var i = Math.floor(x / _cellSize);
    var j = Math.floor(y / _cellSize);

    // Which kind
    var kind = 1 + color_menu0.selectedIndex;

    _torus1.set(i, j, kind);
    render();
    updatePopulation();
}

function updatePopulation() {
    var _population = 0;
    for (var x = 0; x < _size; x++)
        for (var y = 0; y < _size; y++) {
            if (_torus1.get(x, y))
                _population++;
        }

    population.textContent = "Population: " + String(_population);
}
