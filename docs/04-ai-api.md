<!-- filepath: /Users/suley/Desktop/github/overload-pt-ios-app/docs/04-ai-api.md -->
# 04 – AI Coach API Contract (OpenAI)

This document outlines the API contract for interactions with the OpenAI GPT-4o model, which powers the AI Coach feature in Overload PT. The primary goal is to provide users with intelligent suggestions for progressive overload and answer training-related questions.

## General Principles
*   **Model:** `gpt-4o` (or latest recommended by OpenAI for cost/performance balance for chat applications).
*   **API Interaction:** Via HTTPS requests to OpenAI API endpoints, likely using the `openai-swift` library or direct `URLSession` calls.
*   **Authentication:** API key will be securely stored (e.g., in a non-versioned config file during development, and using server-side proxy or secure environment variables in a production-like setup if budget allows; for pure client-side, obfuscation is limited but necessary).
*   **Streaming:** Responses should be streamed where possible for better UX in the chat interface.

## Endpoints & Payloads

### 1. Suggest Next Increment

*   **Purpose:** Provide a specific weight and/or rep suggestion for the user's next session of a given exercise, based on their recent performance and goals.
*   **Trigger:** User explicitly requests a suggestion (e.g., button tap: "Suggest next weight for Bench Press") or as part of a conversational flow.
*   **Max Tokens (Response):** ~150-250 (to allow for a concise suggestion and brief reasoning).

**System Prompt (`messages: [{"role": "system", ...}]`)**

```text
You are OverloadPT AI, an expert strength and hypertrophy coach. Your primary goal is to help users apply progressive overload safely and effectively. You are encouraging, knowledgeable, and provide clear, actionable advice.

- Analyze the user's recent performance for a specific lift.
- Consider their stated experience level and primary goal (strength or hypertrophy).
- Suggest a specific, small, and achievable increment in weight and/or reps for their next session of that exercise.
- Provide a brief (1-2 sentences) reasoning for your suggestion, referencing principles of progressive overload.
- If the user is hitting a plateau or RPE is very high for many reps, you might suggest maintaining weight and increasing a rep, or a very small weight increase.
- If the user is a beginner, prioritize rep increases or very small weight jumps.
- If the user's goal is hypertrophy, slightly higher rep ranges (e.g., adding a rep to a set of 8-12) might be prioritized over large weight jumps if form is a concern.
- If the user's goal is strength, focus on increasing weight once a solid rep target is met (e.g., 3-5 reps).
- Always output your final suggestion in a structured JSON format. The reasoning should be human-readable text.
```

**User Input (Example - `messages: [..., {"role": "user", ...}]`)**

This will be a JSON string within the user message content, or structured data passed to the function calling the API.

```jsonc
{
  "userProfile": {
    "experienceLevel": "intermediate", // "beginner", "intermediate", "advanced"
    "primaryGoal": "hypertrophy" // "strength", "hypertrophy", "maintenance"
  },
  "exerciseContext": {
    "exerciseName": "Barbell Bench Press",
    "lastSessionPerformance": [
      { "setNumber": 1, "weightKg": 80, "reps": 8, "rpe": 7 },
      { "setNumber": 2, "weightKg": 80, "reps": 8, "rpe": 7.5 },
      { "setNumber": 3, "weightKg": 80, "reps": 7, "rpe": 8 }
    ],
    "targetSets": 3,
    "targetRepsMin": 6,
    "targetRepsMax": 10
  }
}
```

**Expected AI Response (JSON Object in `content` of assistant's message)**

```json
{
  "suggestion": {
    "nextWeightKg": 82.5,
    "nextReps": [8, 8, 7], // Or a general rep target like "aim for 6-8 reps"
    "targetRpe": "7-8.5"
  },
  "reasoning": "You completed your sets with good RPE. A 2.5kg increase should be manageable while maintaining good form and staying within your target rep range. Focus on hitting at least 6-8 reps with the new weight."
}
```

### 2. General Training Question / Chat

*   **Purpose:** Allow users to ask general questions about training, progressive overload, form, exercise choices, etc.
*   **Trigger:** User types a question into the AI Coach chat interface.
*   **Max Tokens (Response):** ~300-500 (to allow for a reasonably detailed answer).

**System Prompt (`messages: [{"role": "system", ...}]`)**

```text
You are OverloadPT AI, an expert strength and hypertrophy coach. Your primary goal is to help users apply progressive overload safely and effectively. You are encouraging, knowledgeable, and provide clear, actionable advice. 

- Answer user questions about weightlifting, strength training, hypertrophy, and fitness in a helpful and informative way.
- If asked about form for an exercise, provide key cues and common mistakes. Avoid giving medical advice.
- If asked for exercise alternatives, suggest exercises that target similar muscle groups.
- Keep responses concise and easy to understand.
- You can use markdown for formatting your answers (e.g., bullet points, bold text).
- Do not provide nutritional advice beyond very general hydration and protein intake mentions if directly relevant.
- Do not create full workout plans from scratch in this mode; guide them towards using the app's split builder but you can discuss principles of workout structure.
```

**User Input (Example - `messages: [..., {"role": "user", ...}]`)**

```text
"What are some good alternative exercises for barbell squats if my lower back is feeling a bit tired? I usually do them for my leg day."
```

**Expected AI Response (`content` of assistant's message, Markdown formatted)**

```markdown
If your lower back is feeling tired, it's smart to opt for squat variations that are less demanding on it. Here are a few good alternatives to barbell squats that still work your legs effectively:

*   **Goblet Squats:** Holding a dumbbell or kettlebell at your chest can help you maintain a more upright torso, reducing lower back strain.
*   **Dumbbell Lunges:** These are great for unilateral leg strength and can be easier on the back.
*   **Leg Press:** This machine-based exercise provides good support for your back while allowing you to load up the weight on your quads and glutes.
*   **Belt Squats:** If your gym has a belt squat machine, this is an excellent option as it removes almost all spinal loading.

Remember to focus on form and listen to your body! You can incorporate these into your leg day as primary or accessory movements.
```

## Error Handling & Safety
*   The app will implement timeouts for API requests.
*   Responses from the AI will be parsed. If the JSON structure is incorrect for `Suggest Next Increment`, a fallback message will be shown.
*   A disclaimer will be present in the AI Coach interface stating that the advice is not a substitute for professional medical or certified coaching advice, especially regarding injuries.
*   Rate limiting on the client-side might be implemented to prevent API abuse if a server-side proxy isn't used initially.

---
**Next action** → Review and finalize this AI API Contract. Then proceed to update `05-roadmap.md` and `CONTRIBUTING.md`.