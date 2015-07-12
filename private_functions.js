function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

function standardDeviation(values) {
    var avg = average(values);

    var squareDiffs = values.map(function(value) {
        var diff = value - avg;
        var sqrDiff = diff * diff;
        return sqrDiff;
    });

    var avgSquareDiff = average(squareDiffs);

    var stdDev = Math.sqrt(avgSquareDiff);
    return stdDev;
}

Array.prototype.multiIndexOf = function(el) {
    var idxs = [];
    for (var i = this.length - 1; i >= 0; i--) {
        if (this[i] === el) {
            idxs.unshift(i);
        }
    }
    return idxs;
};

// currently unused
function entropy(arr) {
    var counts = {};
    for (var i = 0; i < arr.length; i++) {
        var num = arr[i];
        counts[num] = counts[num] ? counts[num] + 1 : 1;
    }
    //console.log(counts);
    var sum = 0;
    var total = arr.length;
    for (var k in counts) {
        var p = counts[k] / total;
        sum -= p * Math.log(p) / Math.log(2);
        //console.log(sum);
    }
    return sum;
};

function average(data) {
    var sum = data.reduce(function(sum, value) {
        return sum + value;
    }, 0);

    var avg = sum / data.length;
    return avg;
}

// entropy.js MIT License © 2014 James Abney http://github.com/jabney
// Calculate the Shannon entropy of a string in bits per symbol.
(function(shannon) {
    'use strict';

    // Create a dictionary of character frequencies and iterate over it.
    function process(s, evaluator) {
        var h = Object.create(null),
            k;
        s.split('').forEach(function(c) {
            h[c] && h[c]++ || (h[c] = 1);
        });
        if (evaluator)
            for (k in h) evaluator(k, h[k]);
        return h;
    };

    // Measure the entropy of a string in bits per symbol.
    shannon.entropy = function(s) {
        var sum = 0,
            len = s.length;
        process(s, function(k, f) {
            var p = f / len;
            sum -= p * Math.log(p) / Math.log(2);
        });
        return sum;
    };

    // Measure the entropy of a string in total bits.
    shannon.bits = function(s) {
        return shannon.entropy(s) * s.length;
    };

    // Log the entropy of a string to the console.
    shannon.log = function(s) {
        console.log('Entropy of "' + s + '" in bits per symbol:', shannon.entropy(s));
    };
})(window.shannon = window.shannon || Object.create(null));
