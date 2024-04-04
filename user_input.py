import openai

openai.api_key = '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'

messages = [
    {
        "role": "system",
        "content": "You are an intelligent assistant that will stem the sentence given",
    }
]


def malay_stem(text):
    # Add user message to the conversation
    messages.append(
        {
            "role": "user",
            "content": "You will act as a malay stemmer(use browsing), you will reponse only the stemmed words for: "
            + text,
        }
    )

    # Call the ChatGPT API
    response = openai.ChatCompletion.create(model="gpt-3.5-turbo", messages=messages)

    # Extract the assistant's reply
    reply = response.choices[0].message.content

    # Remove the user message from the conversation
    messages.pop()

    return reply


# Example usage
user_input = input("User: ")
stemmed_output = malay_stem(user_input)
print(f"ChatGPT: {stemmed_output}")