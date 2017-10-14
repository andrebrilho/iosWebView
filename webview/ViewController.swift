//
//  ViewController.swift
//  webview
//
//  Created by André Brilho on 30/11/16.
//  Copyright © 2016 Andre Brilho. All rights reserved.


import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UIAlertViewDelegate {


    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!

    var url:String!
    var nsurl:NSURL!
    var lasturl:NSURL!
    var urlRequest:NSURLRequest!
    var lasturlString:String!
    var urlRequestLast:NSURLRequest!
    var ultimaUrl:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ValidaConexao", name: "ReachStatusChanged", object: nil)
        self.url = "https://www.google.com.br/"
        self.nsurl = NSURL(string: url)
        self.urlRequest = NSURLRequest(URL: nsurl!)
        webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func webViewDidStartLoad(webView: UIWebView) {
        
        ActivityIndicator.startAnimating()
        ValidaConexao()
        
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        
        ActivityIndicator.stopAnimating()

    }

    @IBAction func Voltrar(sender: AnyObject) {

        ActivityIndicator.startAnimating()
        webView.goBack()
        print("Voltar")
        ActivityIndicator.stopAnimating()
    }

    @IBAction func Atualizar(sender: AnyObject) {
        ActivityIndicator.startAnimating()
        webView.reload()
        ActivityIndicator.stopAnimating()
        print("Reload")
    }


    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {

        ActivityIndicator.stopAnimating()
        print("url ->", url)
        print("metodo ->", self.webView.request?.URL?.absoluteString)
        let urlAtual:String = (self.webView.request?.URL?.absoluteString)!
        print("urlAtual", urlAtual)
        
        if (urlAtual == url) || (urlAtual == "") {
            
            print("Iguais")
            self.webView.loadRequest(urlRequest)
            ActivityIndicator.startAnimating()
            return
        }
        print("Diferente")
        lasturlString = self.webView.request?.URL?.absoluteString
        lasturl = NSURL(string: lasturlString)
        urlRequestLast = NSURLRequest(URL: lasturl)
        self.webView.loadRequest(urlRequestLast)
        ActivityIndicator.startAnimating()
        }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        print("Erro Failed")
        
    }
    
    func ValidaConexao() -> Bool{

        if rechabilityStatus != kNOTREACHABLE {
            return false
        }

        print("SEM CONEXAO")
        let alertView = UIAlertView(title: "Sem conexão", message: "Parece que algo deu errado, clique em OK para recarregar", delegate: self, cancelButtonTitle: "Tentar novamente")
        alertView.show()
        
        return true

    }


    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)

    }
}


//=====================//================ FUNCIONANDO ========================//==================//================

//
//  ViewController.swift
//  webview
//
//  Created by André Brilho on 30/11/16.
//  Copyright © 2016 Andre Brilho. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController, UIWebViewDelegate, UIAlertViewDelegate {
//    
//    
//    @IBOutlet weak var webView: UIWebView!
//    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
//    
//    var url:String!
//    var nsurl:NSURL!
//    var lasturl:NSURL!
//    var urlRequest:NSURLRequest!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        webView.delegate = self
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ValidaConexao", name: "ReachStatusChanged", object: nil)
//        
//        self.url = "https://www.google.com.br"
//        self.nsurl = NSURL(string: self.url!)
//        self.urlRequest = NSURLRequest(URL: nsurl!)
//        
//        
//        //        let url = NSURL(string: "https://www.google.com.br")
//        //        let myUrlRequest:NSURLRequest = NSURLRequest(URL: url!)
//        
//        webView.loadRequest(urlRequest)
//        
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    
//    
//    @IBAction func Voltrar(sender: AnyObject) {
//        
//        ActivityIndicator.startAnimating()
//        webView.goBack()
//        print("Voltar")
//        ActivityIndicator.stopAnimating()
//    }
//    
//    @IBAction func Atualizar(sender: AnyObject) {
//        ActivityIndicator.startAnimating()
//        webView.reload()
//        ActivityIndicator.stopAnimating()
//        print("Reload")
//    }
//    
//    
//    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        print("Clicou em recarregar")
//        
//        ActivityIndicator.stopAnimating()
//        //ValidaConexao()
//        webView.loadRequest(urlRequest)
//        ActivityIndicator.startAnimating()
//        
//    }
//    
//    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        
//        ActivityIndicator.stopAnimating()
//        ValidaConexao()
//        ActivityIndicator.stopAnimating()
//        return true
//        
//    }
//    
//    func ValidaConexao() -> Bool{
//        
//        if rechabilityStatus != kNOTREACHABLE {
//            return false
//        }
//        
//        
//        print("SEM CONEXAO")
//        let alertView = UIAlertView(title: "Sem conexão", message: "Parece que algo deu errado, clique em OK para recarregar", delegate: self, cancelButtonTitle: "Tentar novamente")
//        alertView.show()
//        
//        
//        return true
//        
//    }
//    
//    
//    deinit
//    {
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
//        
//    }
//}
//
//
//
//
//
//
//












