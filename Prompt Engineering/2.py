def create_prompt():
    topic = input("Enter the topic for the story:")
    topic = input("Enter thr tone(e.g., serious, humourius, adventourous):")
    
    prompt =f"write a {tone} story about {topic}."
    return prompt



user_prompt = create_prompt()
print("Generated Prompt:", user_prompt)