'use strict';

class state {
    constructor(key, path, parent, reference) {

        this.key = key;
        this.path = path;
        this.parent = parent;
        this.reference = reference;
    }
};

export default state;
