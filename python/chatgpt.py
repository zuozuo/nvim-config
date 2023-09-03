import os
import sys
import time
import threading
from datetime import datetime

from rich.console import Console
from rich.markdown import Markdown

from langchain.chat_models import AzureChatOpenAI
from langchain.schema import HumanMessage
from alive_progress import alive_bar

console = Console()
home = os.getenv("HOME")
workdir = os.path.join(home, "workspace/workstream/chatbot")
sys.path.insert(0, workdir)

BASE_URL = "https://mia-openai-japan-east.openai.azure.com/"
API_KEY = "e5c61124e5c14399b9fe000e56f2a2ea"

PromptTemplate = """

> {content}

"""


def print_md(content):
    console.print(Markdown(content))


def main():
    DEPLOYMENT_NAME = "chat"
    model = AzureChatOpenAI(
        openai_api_base=BASE_URL,
        openai_api_version="2023-05-15",
        deployment_name=DEPLOYMENT_NAME,
        openai_api_key=API_KEY,
        openai_api_type="azure",
    )
    now = datetime.now()  # current date and time
    date = now.strftime("%Y_%m_%d")

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

    thread = threading.Thread(target=progress_bar, args=())
    thread.start()

    message = model([HumanMessage(content=content)])
    thread.join()
    print_md("***")
    console.print("\n")
    print_md(message.content)
    console.print("\n")
    with open(path, "a") as f:
        f.write("\n" + "-" * 30 + "\n")
        f.write("\n" + message.content + "\n")
        f.write("\n" + seperator + "\n\n\n")


def progress_bar():
    with alive_bar(100) as bar:
        for i in range(100):
            bar()
            time.sleep(0.007)


if __name__ == "__main__":
    main()
