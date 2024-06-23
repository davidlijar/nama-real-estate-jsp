
   
      import { GoogleGenerativeAI } from "@google/generative-ai";
		const API_KEY = "AIzaSyC92Kq6UcsQWcqXoZfqNqY3zgZ9XYse-rg";
    // Access your API key (see "Set up your API key" above)
	const genAI = new GoogleGenerativeAI(API_KEY);

	const form = document.getElementById('chatForm');
    const messageInput = document.getElementById('messageInput');
    const chatOutput = document.getElementById('chatOutput');

	async function askGPT() {
  	// The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
  	const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash"});

	


  	const prompt = messageInput.value

  	const result = await model.generateContent(prompt);
  	const response = await result.response;
  	const text = response.text();
  	console.log(text);
	
	chatOutput.innerHTML = text;
    
}

	
