// creating a keylog for wireshark 

static void KeylogCallback(const SSL *ssl, const char *line)
{
    std::ofstream outfile;

    outfile.open("/Users/gietal/keylog.txt", std::ios_base::app); // append instead of overwrite
    outfile << line << "\n";
    
    outfile.close();
}

SSL_CTX_set_keylog_callback(m_osslContext, KeylogCallback);
