import random

cards = [("The Fool","beginnings possibilities, pleasure, thoughtlessness, adventure, opportunity", "indecision, hesitation, injustice, apathy, bad choice"),
("The Magician","creativity, self-confidence, dexterity, sleight of hand,will-power, skill", "delay, unimaginative, insecurity, lack of self-confidence"),
("The High Priestess","knowledge, wisdom, learning, intuition, impatience, virtue, purity", "selfishness, shallowness, misunderstanding, ignorance" ),
("The Empress","development, accomplishment action, evolution", "inaction, lack on concentration, vacillation, anxiety, infidelity"),
("The Emperor", "authority, father-figure, structure, solid foundation", "domination, excessive control, rigidity, inflexibility"),
("The Hierophant","mercy, conformity, forgiveness, social approval, bonded, inspiration", "vulnerability, unconventionality, foolish generosity, impotence, frailty, unorthodoxy"),
("The Lovers","harmony, trust,romance, optimism, honor, love, harmony", "separation, frustration, unreliability,fickleness, untrustworthy"),
("The Chariot", "perseverance, rushed decision, turmoil, vengeance, adversity", "vanquishment, defeat, failure, unsuccessful"),
("Strength","courage, conviction, strength, determination, action, heroism, virility", "pettiness, sickness, unfaithfulness, weakness"),
("The Hermit","inner strength, prudence, withdrawal, caution, vigilance", "hastiness, rashness,immaturity, imprudence, foolishness"),
("The Wheel of Fortune", "unexpected events, advancement, destiny, fortune, progress", "interruption, outside influences, failure, bad luck"),
("Justice", "equality, righteousness, virtue, honor, harmony, balance", "alse accusation, unfairness, abuse, biased"),
("The Hanged Man", "change, reversal, boredom, improvement, rebirth, suspension, change", "false prophecy, useless sacrifice, unwillingness"),
("Death", "unexpected change, loss, failure, transformation, death, bad luck","immobility, slow changes, cheating, death, stagnation"),
("Temperance","emperance, patience, good influence, confidence, moderation", "conflict, disunion, frustration, impatience, discord"),
("The Devil","downfall, unexpected failure, controversy, ravage, disaster, ill tempered", "release, enlightenment, divorce, recovery"),
("The Tower","disruption, abandonment, end of friendship, bankruptcy, downfall, unexpected events", "entrapment, imprisonment, old ways, rustic"),
("The Star","balance, pleasure, optimism, insight, spiritual love, hope, faith", "disappointment, bad luck, imbalance, broken dreams"),
("The Moon","Upright:double-dealing Deception, disillusionment, trickery, error, danger, disgrace", "trifling mistakes, deception discovered, negative advantage"),
("The Sun","accomplishment, success, love, joy, happy marriage, satisfaction", "loneliness, canceled plans, unhappiness, break ups"),
("Judgement","awakening, renewal, rejuvenation, rebirth, improvement, promotion, atonement, judgment","disappointment, indecision, death, failure, ill-health, theft, worry"),
("The World","perfection, recognition, success, fulfillment, eternal life","lack of vision, disappointment, imperfection"),
("Ace of Wands","profitable journey, new business, beginning, new career, birth, inheritance", "selfishness, lack of determination, setback"),
("Two of Wands","generous person, courage, patience, courage", "impatience, domination"),
("Three of Wands","cooperation, good partnership, success", "carelessness, arrogance, pride, mistakes"),
("Four of Wands","dissatisfaction, kindness, reevaluation", "new relationship, new ambitions, action"),
("Five of Wands","lawsuit or quarrel, courage, competition", "new opportunities, harmony, generosity"),
("Six of Wands","leadership, good news, success", "postponement, bad news, pride in riches"),
("Seven of Wands","stiff competition, victory, courage, energy", "advantage, patience, indecision"),
("Eight of Wands","new ideas, love, journey", "violence, quarrels, courage"),
("Nine of Wands","victory, good health, obstinacy", "weakness, ill-health, adversity"),
("Ten of Wands","pain, ruined, failure", "cleverness, energy, strength"),
("Page of Wands","enthusiasm, exploration, discovery, free spirit", "setbacks to new ideas, pessimism, lack of direction"),
("Knight of Wands","generous, journey, impetuous", "suspicion, jealousy, narrow-mindedness"),
("Queen of Wands","fondness, attraction, command", "jealous, revengeful, infidelity"),
("King of Wands", "passionate, good leader, noble", "unyielding, prejudice, quarrels"),
("Ace of Cups", "good health, love, joy, beauty", "egotism, selfishness, hesitancy"),
("Two of Cups", "romance, friendship, cooperation", "violent passion, misunderstanding"),
("Three of Cups", "fortune, hospitality, discovery", "hidden, overindulgence, pain, gossip"),
("Four of Cups", "dissatisfaction, kindness, reevaluation, redemption", "new goals, ambitions, beginning"),
("Five of Cups", "broken marriage,vain regret, sorrow, loss", "return, summon, hope"),
("Six of Cups",  "acquaintance, good memories, acquaintance, happiness", "friendship, disappointment, past"),
("Seven of Cups", "imagination, illusion, directionless", "will-power, determination"),
("Eight of Cups", "disappointment, abandonment, misery", "pleasure, success, joy"),
("Nine of Cups", "physical well-being, hopes, security", "illness, failure, overindulgence"),
("Ten of Cups", "friendship, happiness, life", "waste, broken relationships, quarrel"),
("Page of Cups", "sweetness, interest in literature, gentleness", "poor imagination, selfishness, no desires"),
("Knight of Cups","emotional, romantic dreamer, intelligence", "idleness, untruthful, fraud, sensuality"),
("Queen of Cups", "loving mother, gentle, happiness", "perverse, unhappy, gloom, over-active imagination"),
("King of Cups", "kindness, willingness, enjoyment", "double-dealer, scandal, crafty, violent"),
("Ace of Swords","love, valiant, victory", "obstacles, tyranny, power"),
("Two of Swords","indecision, trouble, balanced", "unscrupulous, release"),
("Three of Swords","broken relationship, civil war", "sorrow, loss, confusion"),
("Four of Swords","temporary exile, strife, retreat", "social unrest, labor strikes, renewed activity"),
("Five of Swords","defeat, cowardliness, empty victory", "unfairness, defeat, loss"),
("Six of Swords","harmony, sorrow, journey", "obstacles, difficulties, defeat"),
("Seven of Swords","betrayal, insolence, unwise attempt", "counsel, helpful, advice"),
("Eight of Swords","weakness, indecision, censure", "freedom, new beginnings, relaxation"),
("Nine of Swords","desolation, illness, suspicion, cruelty", "unselfishness, good news, healing"),
("Ten of Swords" ,"defeat, failure, pain", "courage, positive energy, good health"),
("Page of Swords","grace, diplomacy, dexterity, grace", "imposture, ill-health, cunningness"),
("Knight of Swords","strong man, braver, clever person", "troublemaker, a crafty, tyranny"),
("Queen of Swords","skillful, brave, clever, rush", "sly, keen, deceitful"),
("King of Swords","powerful, friendship, counselor", "obstinate, evil intentions, judgments"),
("Ace of Pentacles","prosperity, happiness, pleasure", "misery, greedy, money"),
("Two of Pentacles","harmony, new projects, helpful", "difficulty, discouragement"),
("Three of Pentacles","abilities, approval,effort, abilities", "preoccupation, ambitions"),
("Four of Pentacles","ungenerous, greed, miserly", "spendthrift, obstacles, earthy possessions"),
("Five of Pentacles","destitution, poor health, despair, loneliness", "employment, courage, revival"),
("Six of Pentacles","prosperity, philanthropy, charity, gifts", "jealousy, miserliness, unfairness"),
("Seven of Pentacles","development, re-evaluation, effort, hard work", "impatience, slow progress, investments"),
("Eight of Pentacles","employment, money, learning, trade", "void, no ambition, dislike"),
("Nine of Pentacles","solitude, well-being, green thumb", "caution, possible loss"),
("Ten of Pentacles","wealth, property, stability", "dull, slothfulness, misfortune"),
("Page of Pentacles","kindness,new ideas/opinions, scholar","luxury, rebellious, bad news"),
("Knight of Pentacles","dull outlook, patience, animal lover, trustworthy","carelessness, standstill, irresponsible"),
("Queen of Pentacles","thoughtfulness, intelligence, talents, melancholy","mistrust, suspicion, neglect"),
("King of Pentacles","reliable person, steadiness", "bribes, materialistic, calm")]


chosen_cards = random.sample(cards, 5)

for card in chosen_cards:
    print(card[0] + ": " + random.choice(["upright: " + card[1], "inverted: " + card[2]]))
    print()

#cards = [("Eight of Pentacles","employment, money, learning, trade", "void, no ambition, dislike"),         ("Nine of Pentacles","solitude, well-being, green thumb", "caution, possible loss"),         ("Ten of Pentacles","wealth, property, stability", "dull, slothfulness, misfortune"),         ("Page of Pentacles","kindness,new ideas/opinions, scholar","luxury, rebellious, bad news"),         ("Knight of Pentacles","dull outlook, patience, animal lover, trustworthy","carelessness, standstill, irresponsible"),         ("Queen of Pentacles","thoughtfulness, intelligence, talents, melancholy","mistrust, suspicion, neglect"),         ("King of Pentacles","reliable person, steadiness", "bribes, materialistic, calm")]

#for card in cards:
#    print(card[0] + ":")
#    print("- upright: " + card[1])
#    print("- inverted: " + card[2])
#    print()

#"The Fool","beginnings possibilities, pleasure, thoughtlessness, adventure, opportunity", "indecision, hesitation, injustice, apathy, bad choice"
#"The Magician","creativity, self-confidence, dexterity, sleight of hand,will-power, skill", "delay, unimaginative, insecurity, lack of self-confidence"
#"The High Priestess","knowledge, wisdom, learning, intuition, impatience, virtue, purity", "selfishness, shallowness, misunderstanding, ignorance"
#"The Empress","development, accomplishment action, evolution", "inaction, lack on concentration, vacillation, anxiety, infidelity"
#"The Emperor", "authority, father-figure, structure, solid foundation", "domination, excessive control, rigidity, inflexibility"
#"The Hierophant","mercy, conformity, forgiveness, social approval, bonded, inspiration", "vulnerability, unconventionality, foolish generosity, impotence, frailty, unorthodoxy"
#"The Lovers","harmony, trust,romance, optimism, honor, love, harmony", "separation, frustration, unreliability,fickleness, untrustworthy"
#"The Chariot", "perseverance, rushed decision, turmoil, vengeance, adversity", "vanquishment, defeat, failure, unsuccessful"
#"Strength","courage, conviction, strength, determination, action, heroism, virility", "pettiness, sickness, unfaithfulness, weakness"
#"The Hermit","inner strength, prudence, withdrawal, caution, vigilance", "hastiness, rashness,immaturity, imprudence, foolishness"
#"The Wheel of Fortune", "unexpected events, advancement, destiny, fortune, progress", "interruption, outside influences, failure, bad luck"
#"Justice", "equality, righteousness, virtue, honor, harmony, balance", "alse accusation, unfairness, abuse, biased"
#"The Hanged Man", "change, reversal, boredom, improvement, rebirth, suspension, change", "false prophecy, useless sacrifice, unwillingness"
#"Death", "unexpected change, loss, failure, transformation, death, bad luck","immobility, slow changes, cheating, death, stagnation"
#"Temperance","emperance, patience, good influence, confidence, moderation", "conflict, disunion, frustration, impatience, discord"
#"The Devil","downfall, unexpected failure, controversy, ravage, disaster, ill tempered", "release, enlightenment, divorce, recovery"
#"The Tower","disruption, abandonment, end of friendship, bankruptcy, downfall, unexpected events", "entrapment, imprisonment, old ways, rustic"
#"The Star","balance, pleasure, optimism, insight, spiritual love, hope, faith", "disappointment, bad luck, imbalance, broken dreams"
#"The Moon","Upright:double-dealing Deception, disillusionment, trickery, error, danger, disgrace", "trifling mistakes, deception discovered, negative advantage"
#"The Sun","accomplishment, success, love, joy, happy marriage, satisfaction", "loneliness, canceled plans, unhappiness, break ups"
#"Judgement","awakening, renewal, rejuvenation, rebirth, improvement, promotion, atonement, judgment","disappointment, indecision, death, failure, ill-health, theft, worry"
#"The World","perfection, recognition, success, fulfillment, eternal life","lack of vision, disappointment, imperfection"
#"Ace of Wands","profitable journey, new business, beginning, new career, birth, inheritance", "selfishness, lack of determination, setback"
#"Two of Wands","generous person, courage, patience, courage", "impatience, domination"
#"Three of Wands","cooperation, good partnership, success", "carelessness, arrogance, pride, mistakes"
#"Four of Wands","dissatisfaction, kindness, reevaluation", "new relationship, new ambitions, action"
#"Five of Wands","lawsuit or quarrel, courage, competition", "new opportunities, harmony, generosity"
#"Six of Wands","leadership, good news, success", "postponement, bad news, pride in riches"
#"Seven of Wands","stiff competition, victory, courage, energy", "advantage, patience, indecision"
#"Eight of Wands","new ideas, love, journey", "violence, quarrels, courage"
#"Nine of Wands","victory, good health, obstinacy", "weakness, ill-health, adversity"
#"Ten of Wands","pain, ruined, failure", "cleverness, energy, strength"
#"Page of Wands","enthusiasm, exploration, discovery, free spirit", "setbacks to new ideas, pessimism, lack of direction"
#"Knight of Wands","generous, journey, impetuous", "suspicion, jealousy, narrow-mindedness"
#"Queen of Wands","fondness, attraction, command", "jealous, revengeful, infidelity"
#"King of Wands", "passionate, good leader, noble", "unyielding, prejudice, quarrels"
#"Ace of Cups", "good health, love, joy, beauty", "egotism, selfishness, hesitancy"
#"Two of Cups", "romance, friendship, cooperation", "violent passion, misunderstanding"
#"Three of Cups", "fortune, hospitality, discovery", "hidden, overindulgence, pain, gossip"
#"Four of Cups", "dissatisfaction, kindness, reevaluation, redemption", "new goals, ambitions, beginning"
#"Five of Cups", "broken marriage,vain regret, sorrow, loss", "return, summon, hope"
#"Six of Cups",  "acquaintance, good memories, acquaintance, happiness", "friendship, disappointment, past"
#"Seven of Cups", "imagination, illusion, directionless", "will-power, determination"
#"Eight of Cups", "disappointment, abandonment, misery", "pleasure, success, joy"
#"Nine of Cups", "physical well-being, hopes, security", "illness, failure, overindulgence"
#"Ten of Cups", "friendship, happiness, life", "waste, broken relationships, quarrel"
#"Page of Cups", "sweetness, interest in literature, gentleness", "poor imagination, selfishness, no desires"
#"Knight of Cups","emotional, romantic dreamer, intelligence", "idleness, untruthful, fraud, sensuality"
#"Queen of Cups", "loving mother, gentle, happiness", "perverse, unhappy, gloom, over-active imagination"
#"King of Cups", "kindness, willingness, enjoyment", "double-dealer, scandal, crafty, violent"
#"Ace of Swords","love, valiant, victory", "obstacles, tyranny, power"
#"Two of Swords","indecision, trouble, balanced", "unscrupulous, release"
#"Three of Swords","broken relationship, civil war", "sorrow, loss, confusion"
#"Four of Swords","temporary exile, strife, retreat", "social unrest, labor strikes, renewed activity"
#"Five of Swords","defeat, cowardliness, empty victory", "unfairness, defeat, loss"
#"Six of Swords","harmony, sorrow, journey", "obstacles, difficulties, defeat"
#"Seven of Swords","betrayal, insolence, unwise attempt", "counsel, helpful, advice"
#"Eight of Swords","weakness, indecision, censure", "freedom, new beginnings, relaxation"
#"Nine of Swords","desolation, illness, suspicion, cruelty", "unselfishness, good news, healing"
#"Ten of Swords" ,"defeat, failure, pain", "courage, positive energy, good health"
#"Page of Swords","grace, diplomacy, dexterity, grace", "imposture, ill-health, cunningness"
#"Knight of Swords","strong man, braver, clever person", "troublemaker, a crafty, tyranny"
#"Queen of Swords","skillful, brave, clever, rush", "sly, keen, deceitful"
#"King of Swords","powerful, friendship, counselor", "obstinate, evil intentions, judgments"
#"Ace of Pentacles","prosperity, happiness, pleasure", "misery, greedy, money"
#"Two of Pentacles","harmony, new projects, helpful", "difficulty, discouragement"
#"Three of Pentacles","abilities, approval,effort, abilities", "preoccupation, ambitions"
#"Four of Pentacles","ungenerous, greed, miserly", "spendthrift, obstacles, earthy possessions"
#"Five of Pentacles","destitution, poor health, despair, loneliness", "employment, courage, revival"
#"Six of Pentacles","prosperity, philanthropy, charity, gifts", "jealousy, miserliness, unfairness"
#"Seven of Pentacles","development, re-evaluation, effort, hard work", "impatience, slow progress, investments"
#"Eight of Pentacles","employment, money, learning, trade", "void, no ambition, dislike"
#"Nine of Pentacles","solitude, well-being, green thumb", "caution, possible loss"
#"Ten of Pentacles","wealth, property, stability", "dull, slothfulness, misfortune"
#"Page of Pentacles","kindness,new ideas/opinions, scholar","luxury, rebellious, bad news"
#"Knight of Pentacles","dull outlook, patience, animal lover, trustworthy","carelessness, standstill, irresponsible"
#"Queen of Pentacles","thoughtfulness, intelligence, talents, melancholy","mistrust, suspicion, neglect"
#"King of Pentacles","reliable person, steadiness", "bribes, materialistic, calm"
