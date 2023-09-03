# continue.dev GGML client + llama-cpp-python server with GGUF model and GPU offloading
This a sample Windows helper repo which uses llama-cpp-python with a GGUF model and NVIDIA GPU offloading to serve as a local LLM for the continue.dev VSCode extension.

This is based on the https://continue.dev/docs/customization#local-models-with-ggml example.

![Alt text](screenshot.png?raw=true "Running")

## Install
Clone this repo somewhere.

You need Python (tested with 3.10.11 x64 on Windows 11), NVIDIA CUDA Toolkit (tested with v11.7) as well as Visual Studio Build Tools 2022 installed.

Run `setup.bat`. It should create a virtualenv and install llama-cpp-python server with compiled CUBLAS support.

## Model download
You need a GGUF model compatible with the size of your GPU. The Bloke's models have a table on each page detailing the memory requirements.
This repos is expecting `phind-codellama-34b-v2.Q4_K_M.gguf` (https://huggingface.co/TheBloke/Phind-CodeLlama-34B-v2-GGUF) placed into a `models` subfolder by default. This fits into a 24GB GPU (eg. RTX3090/4090). run.bat is configured so all layers are offloaded to the VRAM.
You need to fine tune this based on your PC specs.

## Running and using in continue.dev
Execute `run.bat`, model should be loaded to the GPU and the Uvicorn server prompt is shown with the host and port.

Install continue.dev extension to VSCode, then on it's tab enter `\config`.
In config.py add the necessary GGML config.

Add top import

	from continuedev.src.continuedev.libs.llm.ggml import GGML
	
Change the config model declaration.

	config = ContinueConfig(
		...
		models=Models(
			default=GGML(max_context_length=2048)
		)
		...
	)
	
Reload VSCode, and have fun.