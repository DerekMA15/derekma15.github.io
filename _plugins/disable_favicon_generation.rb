# _plugins/disable_favicon_generation.rb
# Impede que o Chirpy regenere os favicons automaticamente

Jekyll::Hooks.register :site, :after_init do |site|
  # Remove a configuração de favicon do tema
  if site.config.key?('favicon')
    site.config['favicon'] = {} if site.config['favicon'].nil?
    site.config['favicon']['auto_generate'] = false
    site.config['favicon']['source'] = nil
  end
  
  # Desativa o gerador de manifest do PWA
  if site.config.key?('pwa')
    site.config['pwa']['enabled'] = false
    site.config['pwa']['manifest']['enabled'] = false
  end
end

# Hook para impedir a cópia de favicons padrão
Jekyll::Hooks.register :site, :post_write do |site|
  favicon_dir = File.join(site.dest, 'assets', 'img', 'favicons')
  
  # Se o diretório de favicons existe, mantém apenas os arquivos do usuário
  if Dir.exist?(favicon_dir)
    # Remove arquivos padrão do Chirpy (que começam com 'favicon-')
    Dir.glob(File.join(favicon_dir, 'favicon-*')).each do |file|
      unless file.include?('favicon-16x16') || 
             file.include?('favicon-32x32') || 
             file.include?('favicon-96x96') ||
             file.include?('apple-touch-icon')
        File.delete(file) if File.exist?(file)
      end
    end
  end
end