python -m venv env
call .\env\Scripts\activate.bat

set CMAKE_ARGS="-DLLAMA_CUBLAS=on"
set FORCE_CMAKE=1
pip install llama-cpp-python[server]==0.1.83 --force-reinstall --upgrade --no-cache-dir --verbose
