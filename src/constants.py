#!/usr/bin/diffusion_venv python3.10
# encoding: utf-8

UNARY = ['exp', 'log', 'inv']
BINARY = ['+', '-', '*', '/']

N_FEATURES = 5

NODE_TYPES = {
        'binary_operators': BINARY,
        'unary_operators': UNARY,
        'operators': BINARY + UNARY,
        'operands': ['x' + str(i) for i in range(N_FEATURES)],
        'constants': 'random'
}

N_SAMPLES = 1000

MIN_LOG10_VAL = -4
MAX_LOG10_VAL = 4

MAX_DEPTH=3