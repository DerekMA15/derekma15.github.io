# _plugins/force_favicons.rb
# Força a cópia dos favicons após o build

Jekyll::Hooks.register :site, :post_write do |site|
  # Caminhos
  source_dir = File.join(site.source, 'assets', 'img', 'favicons')
  dest_dir = File.join(site.dest, 'assets', 'img', 'favicons')
  
  # Se o diretório fonte existe
  if Dir.exist?(source_dir)
    # Criar diretório destino se não existir
    FileUtils.mkdir_p(dest_dir) unless Dir.exist?(dest_dir)
    
    # Copiar TODOS os arquivos da fonte para o destino (sobrescrevendo)
    FileUtils.cp_r(Dir.glob(File.join(source_dir, '*')), dest_dir)
    
    # Remover arquivos que começam com 'favicon-' mas NÃO são os personalizados
    # (Isso remove os gerados automaticamente)
    Dir.glob(File.join(dest_dir, 'favicon-*.png')).each do |file|
      # Mantém apenas 16x16, 32x32, 96x96
      unless file.include?('favicon-16x16') || 
             file.include?('favicon-32x32') || 
             file.include?('favicon-96x96') ||
             file.include?('apple-touch-icon') ||
             file.include?('web-app-manifest')
        File.delete(file) if File.exist?(file)
      end
    end
    
    # Log de sucesso
    Jekyll.logger.info "✅ Favicons personalizados copiados com sucesso!"
  end
end