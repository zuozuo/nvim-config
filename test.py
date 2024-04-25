
import os

# Set the OpenAI API key
openai_api_key = "..."
os.environ["OPENAI_API_KEY"] = openai_api_key

from langchain.document_loaders import TextLoader

# Load your text data using the TextLoader
loader = TextLoader("./README.md")
documents = loader.load()

from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import Chroma
from langchain.text_splitter import CharacterTextSplitter

# Generate VectorDB using Chroma and OpenAIEmbeddings
text_splitter = CharacterTextSplitter(chunk_size=500, chunk_overlap=0)
texts = text_splitter.split_documents(documents)
embeddings = OpenAIEmbeddings()
docsearch = Chroma.from_documents(texts, embeddings)

from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA
from langchain.callbacks.streaming_stdout import StreamingStdOutCallbackHandler

# Create a ChatOpenAI instance for interactive chat using the OpenAI model
llm = ChatOpenAI(
    streaming=True,
    callbacks=[StreamingStdOutCallbackHandler()],
    temperature=0,
    openai_api_key=openai_api_key,
)

# Create a RetrievalQA chain using the ChatOpenAI model and the document retriever
qa = RetrievalQA.from_chain_type(
    llm=llm,
    chain_type="stuff",
    retriever=docsearch.as_retriever(),
)

# Run the QA system by providing a question to the chain
qa.run("Your question")
