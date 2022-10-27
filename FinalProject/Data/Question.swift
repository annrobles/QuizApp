//
//  Topic.swift
//  FinalProject
//
//  Created by Ann Robles on 10/24/22.
//

import UIKit

class Question {
    var questionText: String?
    var questionImage: UIImage?
    var options: [String]?
    var recyclingInfo: String?
    var answer: Character?
    var optionImage: [UIImage]?
    
    init(questionText: String? = nil, questionImage: UIImage? = nil, options: [String]? = nil, optionImage: [UIImage]? = nil, answer: Character? = nil, recyclingInfo: String? = nil) {
        self.questionText = questionText
        self.questionImage = questionImage
        self.options = options
        self.answer = answer
        self.recyclingInfo = recyclingInfo
        self.optionImage = optionImage
    }
    
    func getQuestions() -> [Question] {
        return [
            Question(
                questionText: "What item is not acceptable in the Blue Bin?",
                options: [
                    "Paper",
                    "Plastic Packaging",
                    "Bottles, jars (lids on)",
                    "Metal"
                ],
                optionImage: [
                    UIImage(named: "paper") ?? UIImage(),
                    UIImage(named: "plastic-packaging") ?? UIImage(),
                    UIImage(named: "bottles") ?? UIImage(),
                    UIImage(named: "metal") ?? UIImage()
                ],
                answer: "B",
                recyclingInfo: "Any items that are black, including takeout containers, bags, plant trays and flower pots are not acceptable for the Blue Bin."
            ),
            Question(
                questionText: "Which of these does recycling do?",
                options: [
                    "Protects forests",
                    "Keeps oceans cleaner",
                    "Reduces air pollution",
                    "All of the above"
                ],
                optionImage: [
                    UIImage(named: "forest") ?? UIImage(),
                    UIImage(named: "ocean") ?? UIImage(),
                    UIImage(named: "clean-air") ?? UIImage(),
                    UIImage(named: "earth") ?? UIImage()
                ],
                answer: "D",
                recyclingInfo: "With every item you recycle, you’re helping conserve our planet’s finite natural resources and creating a greener Earth."
            ),
            Question(
                questionText: "What should you do with your soy milk carton?",
                questionImage:UIImage(named: "soy-milk-cartoon") ?? UIImage(),
                options: [
                    "Recycle it!",
                    "Trash it.",
                    "Ask me after I’ve had my coffee.",
                    "Throw it anywhere."
                ],
                answer: "A",
                recyclingInfo: "Food and beverage cartons are made primarily of paper, and they’re recyclable. Just toss them in the bin with the cap on."
            ),
            Question(
                questionText: "Which of these items can be made from recycled materials?",
                options: [
                    "Tissue paper",
                    "Blue jeans",
                    "Building materials",
                    "All of the above"
                ],
                optionImage: [
                    UIImage(named: "tissue-paper") ?? UIImage(),
                    UIImage(named: "blue-jeans") ?? UIImage(),
                    UIImage(named: "building-materials") ?? UIImage(),
                    UIImage(named: "all-recyle-result-materials") ?? UIImage()
                ],
                answer: "D",
                recyclingInfo: "Paper, plastic, and other materials recovered from recycled items can be used to make everything from tissue paper to building materials. Recycled plastic bottles are even used to make some types of blue jeans."
            ),
            Question(
                questionText: "What color of the bin is recycling?",
                options: [
                    "Green bin",
                    "Black bin",
                    "Blue bin",
                    "All of the above"
                ],
                optionImage: [
                    UIImage(named: "green-bin") ?? UIImage(),
                    UIImage(named: "black-bin") ?? UIImage(),
                    UIImage(named: "blue-bin") ?? UIImage(),
                    UIImage(named: "all-bins") ?? UIImage()
                ],
                answer: "C",
                recyclingInfo: "Blue is for recycling. Green is for organics. Black is for garbage."
            ),
            Question(
                questionText: "About how much trash does the average Canadian generate each day?",
                questionImage:UIImage(named: "trash") ?? UIImage(),
                options: [
                    "0.5 Kilograms",
                    "0.8 Kilograms",
                    "1 Kilogram",
                    "2 Kilograms"
                ],
                answer: "B",
                recyclingInfo: "It’s estimated that the average Canadian generates just under one kilogram of trash over the course of their day."
            )
        ]
    }
}

// Source: RecycleCartons.ca
