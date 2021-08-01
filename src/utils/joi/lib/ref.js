'use strict';

// Load modules

import * as Hoek from 'hoek';


// Declare internals

const internals = {};


export const create = function (key, options) {

    Hoek.assert(typeof key === 'string', 'Invalid reference key:', key);

    const settings = Hoek.clone(options);         // options can be reused and modified

    const ref = function (value, validationOptions) {

        return Hoek.reach(ref.isContext ? validationOptions.context : value, ref.key, settings);
    };

    ref.isContext = (key[0] === ((settings && settings.contextPrefix) || '$'));
    ref.key = (ref.isContext ? key.slice(1) : key);
    ref.path = ref.key.split((settings && settings.separator) || '.');
    ref.depth = ref.path.length;
    ref.root = ref.path[0];
    ref.isJoi = true;

    ref.toString = function () {

        return (ref.isContext ? 'context:' : 'ref:') + ref.key;
    };

    return ref;
};


export const isRef = function (ref) {

    return typeof ref === 'function' && ref.isJoi;
};


export const push = function (array, ref) {

    if (isRef(ref) &&
        !ref.isContext) {

        array.push(ref.root);
    }
};

export default {
  create,
  isRef,
  push
}
