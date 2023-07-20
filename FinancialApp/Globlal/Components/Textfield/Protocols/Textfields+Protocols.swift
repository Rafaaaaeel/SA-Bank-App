protocol CommonTextFieldDelegate: AnyObject {
    
    func didStartEdditing()
    func didEndEdditting()
    func didChangedText()
    
}

protocol CommonTextFieldActionDelegate: AnyObject {
    
    func didTouchButton()
    
}
