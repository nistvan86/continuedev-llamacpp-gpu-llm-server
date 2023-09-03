@echo off
call .\env\Scripts\activate.bat
python -m llama_cpp.server --model models/phind-codellama-34b-v2.Q4_K_M.gguf --n_gpu_layers 99999 --verbose VERBOSE
