import os
import io
from PIL import Image
from dotenv import load_dotenv
from fastapi import FastAPI, UploadFile
from transformers import ViltProcessor, ViltForQuestionAnswering
import nest_asyncio
from pyngrok import ngrok
import uvicorn

# Load environment variables from .env
load_dotenv()
NGROK_AUTH_TOKEN = os.getenv("NGROK_AUTH_TOKEN")

# Set ngrok auth token
ngrok.set_auth_token(NGROK_AUTH_TOKEN)

# Initialize model and processor
processor = ViltProcessor.from_pretrained("dandelin/vilt-b32-finetuned-vqa")
model = ViltForQuestionAnswering.from_pretrained("dandelin/vilt-b32-finetuned-vqa")

# Define model inference function
def model_pipeline(text: str, image: Image.Image):
    encoding = processor(image, text, return_tensors="pt")
    outputs = model(**encoding)
    logits = outputs.logits
    idx = logits.argmax(-1).item()
    return model.config.id2label[idx]

# Set up FastAPI app
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.post("/ask")
def ask(text: str, image: UploadFile):
    content = image.file.read()
    image = Image.open(io.BytesIO(content))
    result = model_pipeline(text, image)
    return {"answer": result}

# Start the FastAPI app with ngrok tunnel
ngrok_tunnel = ngrok.connect(8000)
print("Public URL:", ngrok_tunnel.public_url)
nest_asyncio.apply()
uvicorn.run(app, port=8000)
