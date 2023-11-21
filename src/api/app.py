import multiprocessing
import os
from argparse import ArgumentParser
from pathlib import Path
from typing import Any, Callable, Dict

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

from api.test import router as test_router

app = FastAPI()

origins = [
    "https://cedar-rf.saclay.inria.fr",
    "http://cedar-rf.saclay.inria.fr",
    "https://cedar-rf.saclay.inria.fr:8081",
    "http://cedar-rf.saclay.inria.fr:8081",
    "https://cedar-rf.saclay.inria.fr:8002",
    "http://cedar-rf.saclay.inria.fr:8002",
    "http://cedar-rf.saclay.inria.fr:8001",
    "https://cedar-rf.saclay.inria.fr:8001",
    "http://localhost:3000",
    "localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
    expose_headers=[
        "Connection",
        "Accept-Ranges",
    ],
)

app.include_router(test_router.router)


@app.get("/")
async def read_root():
    return {"Hello": "World"}
