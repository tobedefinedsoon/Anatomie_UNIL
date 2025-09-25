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

Link to icon: 
https://icon.kitchen/i/H4sIAAAAAAAAAzVQTUtDMRD8K7Jee2hrq%2B27SVERRETqSTzkY5MG87IlyVMf5f13d1N6CbvDzM5MTvCj4oAFuhNYlb%2F3B%2BwRupoHnIHz%2B%2FHIG1T8q9B2GTq4T6pSH5AxfeH4rGzAJDztny4LnzUUKS%2BYcb1ym6VZMaFBS4G2er3Vtwyp5COfWdysJzHaxXBUuekLiiUNNYaElqnBUGJEGYOlBB1iqCOwSivrJcnH6%2FOLpJB1J05iNJ%2FfbbSonX9wDk3lylAMZSnh%2FJuyNiQvfpWO0K1nkIM%2FsDNPmirXbWNEJ1jL%2BEjngk71IY587p2YSVc7ShZTaVk1RXv%2Bzok1Pdkhymd%2Fcl%2BbKbQ6VPj9RQ1f0z%2B1gIe7jwEAAA%3D%3D
