require "openai"

openai_client = OpenAI::Client.new(
  access_token: ENV.fetch("OPENAI_TOKEN"),
  request_timeout: 240 # Optional parameter; increases the number of seconds before a request times out
)

response = openai_client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required. I recommend using gpt-3.5-turbo while developing, because it's a LOT cheaper than gpt-4
        messages: [
          { role: "system", content: "You are a helpful assistant that talks like Shakespeare." },
          { role: "user", content: "when is fall 2023"}
        ],
        temperature: 0.7,
    }
)

p response.parsed_response.fetch("choices").at(0).fetch("message").fetch("content")
