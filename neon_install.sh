#!/bin/bash

conda info --envs
source activate neon
git clone https://github.com/NervanaSystems/neon.git
cd neon
python setup.py develop
source deactivate