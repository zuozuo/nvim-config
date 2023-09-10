import os
import sys
import time
import threading
from datetime import datetime

from rich.console import Console
from rich.markdown import Markdown

from langchain.chat_models import AzureChatOpenAI
from langchain.schema import HumanMessage
from langchain.chat_models import ChatOpenAI
from langchain.callbacks.streaming_stdout import StreamingStdOutCallbackHandler

console = Console()
home = os.getenv("HOME")
workdir = os.path.join(home, "workspace/workstream/chatbot")
sys.path.insert(0, workdir)

AZURE_API_KEY = os.getenv("AZURE_API_KEY")
AZURE_BASE_URL = os.getenv("AZURE_BASE_URL")

PromptTemplate = """

> {content}

"""

def print_md(content):
    console.print(Markdown(content))

def main():
    DEPLOYMENT_NAME = "chat"
    model = AzureChatOpenAI(
        openai_api_base=AZURE_BASE_URL,
        openai_api_version="2023-05-15",
        deployment_name=DEPLOYMENT_NAME,
        openai_api_key=AZURE_API_KEY,
        openai_api_type="azure",
        temperature=0,
        streaming=True,
        callbacks=[StreamingStdOutCallbackHandler()],
    )
    now = datetime.now()  # current date and time
    date = now.strftime("%Y_%m_%d_%H")

    path = os.path.join(home, f".config/nvim/prompts/conversation_{date}.md")
    if len(sys.argv) > 1:
        path = sys.argv[1]

    with open(path, "r") as f:
        content = f.read()

    seperator = "=" * 100
    content = content.split(seperator)[-1]

    if "".join(content.split()):
        print_md(content)
        console.print("\n")
    else:
        print_md("> WARNING: prompt is empty !!!")
        console.print("\n")
        sys.exit(1)

    message = model([HumanMessage(content=content)])
    print_md("***")
    console.print("\n")
    print_md(message.content)
    console.print("\n")
    with open(path, "a") as f:
        f.write("\n" + "-" * 30 + "\n")
        f.write("\n" + message.content + "\n")
        f.write("\n" + seperator + "\n\n\n")


if __name__ == "__main__":
    main()
