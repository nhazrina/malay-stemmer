from flask import Flask, request, render_template
import openai
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
 
openai.api_key = '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'
 
messages = [
    {
        "role": "system",
        "content": "You are an intelligent assistant that will stem the sentence given",
    }
]
 
app = Flask(__name__)
 
 
@app.route("/", methods=["GET", "POST"])
def malay_stem():
    factory = StemmerFactory()
    stemmer = factory.create_stemmer()
 
    if request.method == "POST":
        text = request.form["text"]
        sastrawi_stemmed = stemmer.stem(text)
 
        # Add user message to the conversation
        messages.append(
            {
                "role": "user",
                "content": "You will act as a Malay stemmer, remember to only response the stemmed word only, for example, saya pergi ke keda beli bawang → saya pergi ke kedai beli bawang to saya pergi ke kedai beli bawang  do not respond with my input, you will respond only with the stemmed words for: "
                + sastrawi_stemmed,
            }
        )
 
        # Call the ChatGPT API
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo", messages=messages
        )
 
        # Extract the assistant's reply
        reply = response.choices[0].message.content
 
        # Remove the user message from the conversation
        messages.pop()
 
        return render_template(
            "index.html", reply=reply, input=text, sastrawi=sastrawi_stemmed
        )
 
    return render_template("index.html")
 
 
if __name__ == "__main__":
    app.run(port=5001, debug=True)