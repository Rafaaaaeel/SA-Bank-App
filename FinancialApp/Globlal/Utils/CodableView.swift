public protocol CodableViews {
    
    func setup()
    func configView()
    func setupHiearchy()
    func setupContraints()
    func renders()
    
}

extension CodableViews {
    
    func configView() { }
    
    func setup(){
        setupHiearchy()
        setupContraints()
        configView()
        renders()
    }
    
    
    func renders() { }
    
}
