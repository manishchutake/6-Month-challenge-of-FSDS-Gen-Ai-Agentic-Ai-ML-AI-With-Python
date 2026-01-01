topics = ["artificial intalligence", "space exploration", "ancient history"]
tones = ["serious", "humorous", "inspirational"]

prompts = []
for topic in topics:
    for tone in tones:
        prompt = f"write a {tone} story about {topic}."
        prompts.append(prompt)
        
for prompt in prompts:
    print(prompt)