if status is-interactive                                                                                                       
                                                                                                                               
    source ~/.alias

    #if [ "$OS" = "Darwin" ]
    #     source ~/.alias_macos                                                                                                  
    # end
    # 
    # if [ "$OS" = "Linux" ]
    #     source ~/.alias_linux                                                                                                  
    # end                                                                                                                       
    mcfly init fish | source                                                                                                   
end                                                                                                                            
                                                                                                                               
#bind \t accept-autosuggestion   
