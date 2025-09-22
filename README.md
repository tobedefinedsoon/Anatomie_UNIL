# App Overview

  Anatomie UNIL is an educational quiz application for medical students
  studying human anatomy at UNIL (University of Lausanne). It tests
  knowledge of muscle anatomy including origins, insertions, innervation,
  and vascularization.

# Core Features

  1. Quiz Categories

  - Membre supérieur (Upper limb) - shoulder, arm, forearm, hand muscles
  - Membre inférieur (Lower limb) - hip, thigh, leg, foot muscles
  - Tronc (Trunk) - neck, back, thorax, abdomen muscles
  - Tout (All) - Combined quiz from all categories

  2. Question Types

  - Origin - Where the muscle originates
  - Insertion/Termination - Where the muscle inserts
  - Innervation - Nerve supply of the muscle
  - Vascularization - Blood supply (arteries)

  3. Quiz Functionality

  - Configurable number of questions (slider from 1-50+)
  - Toggle question types on/off
  - Multiple choice format (4 answer options)
  - Immediate feedback (green for correct, red for incorrect)
  - Progress bar showing quiz completion
  - Automatic advancement after correct answer (1 second delay)
  - Prevents duplicate questions in same session

  4. Results & Review

  - Final score/grade (1-6 scale based on percentage)
  - Review all questions with correct/incorrect status
  - Detailed view showing user's answer vs correct answer
  - Ability to report errors via email to developer

  5. Data Model

  - Muscle database: 200+ muscles with properties:
    - Name
    - Origin
    - Insertion
    - Innervation
    - Vascularization
  - Question generation: Random selection from appropriate muscle group
  - Session tracking: Questions asked, user answers, correct answers

# Technical Architecture

  - Platform: iOS (iPhone & iPad universal app)
  - Original Tech: Xamarin.iOS (C#)
  - UI: Storyboard-based with programmatic elements
  - Data: Hard-coded muscle database in Data.cs
  - Settings: Basic user preferences (question count, types)
