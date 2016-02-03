#!/bin/bash

source activate neon
conda install -y openblas
git clone https://github.com/NervanaSystems/neon.git
cd neon
python setup.py develop
source deactivate