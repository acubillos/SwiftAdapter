// Playground - noun: a place where people can play
// By Andres Cubillos
// jactheman@gmail.com



import Cocoa

protocol AmericanTextObject {
    var text:String? {get}
    var color:String? {get}
    var sizeInches:Float? {get}
}

class AmericanEnglishTextObject : AmericanTextObject  {
    var text:String?
    var color:String?
    var sizeInches:Float?
    
    typealias TextObjectBuilderClosure = (AmericanEnglishTextObject) -> ()
    
    init(buildClosure: TextObjectBuilderClosure) {
        buildClosure(self)
    }
    
}

protocol BritishTextObject {
    var text:String? { get }
    var colour:String? { get }
    var sizeMilimiters:Float? {get}
}

class BritishEnglishTextObject : BritishTextObject {
    var text:String?
    var colour:String?
    var sizeMilimiters:Float?
    
    typealias TextObjectBuilderClosure = (BritishEnglishTextObject) -> ()
    
    init(buildClosure: TextObjectBuilderClosure) {
        buildClosure(self)
    }
}

class TextRenderer {
    class func render(#text:AmericanEnglishTextObject) -> (text:String!, color:String!, sizeInches:Float!) {
        
        var textRendered = AmericanEnglishTextObject{
            if let text = text.text { $0.text = "I am text: \(text)" }
            if let color = text.color { $0.color = "I am colored: \(color)" }
            if let sizeInches = text.sizeInches { $0.sizeInches = sizeInches }
        }
        return (textRendered.text!, textRendered.color!, textRendered.sizeInches!)
    }
}



var aETO = AmericanEnglishTextObject { item in
    item.text = "hi"
    item.color = "red"
    item.sizeInches = 12
}


var rendered = TextRenderer.render(text:aETO)
rendered.sizeInches
rendered.color
rendered.text



extension TextRenderer {
    class func render(#text:String, colour:String, sizeMilimeters:Float) -> (text:String!, color:String!, sizeInches:Float!) {
        var americanEnglishText = AmericanEnglishTextObject {
            $0.color = colour;
            $0.text = text;
            $0.sizeInches = sizeMilimeters/25.4
        }
        return self.render(text:americanEnglishText)
    }
}



var bTO = BritishEnglishTextObject { item in
    item.text = "I am british"
    item.colour = "RED"
    item.sizeMilimiters = 37
}


var britishRenderedTheAmericanWay = TextRenderer.render(text:bTO.text!, colour:bTO.colour!, sizeMilimeters:bTO.sizeMilimiters!)

britishRenderedTheAmericanWay.color
britishRenderedTheAmericanWay.sizeInches
britishRenderedTheAmericanWay.text



