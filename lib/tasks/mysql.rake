namespace :mysql do
  @username = 'root'
  @password = '123abc..'
  @database = 'wxshopadmin-dev'
  dump_dir = Rails.root.join('db', 'dump')
  mkdir dump_dir unless Dir.exist?(dump_dir)
  timestamp = Time.now.strftime('%Y%m%d%H%M%S')
  @filename = File.join(dump_dir, timestamp)

  desc "Dump old data"
  task :dump do
    sh "mysqldump -u#{@username} -p#{@password} #{@database} > #{@filename}"
  end

  desc "Restore old data"
  task :restore do
    files = Dir.glob(dump_dir + '*')
    @filename = files.last
    # 获取的数据是传递进去的数据库名称
    # Database: wxshopadmin-dev
    # +--------+
    # | Tables |
    # +--------+
    # +--------+
    # database = `mysqlshow -u#{@username} -p#{@password} #{@database} | grep Wildcard | awk -F '[: ]' '{print $NF}'`
    # 删除重建原数据库
    # result = `mysqlshow -u#{@username} -p#{@password} #{@database} | grep -v Wildcard | grep -o #{@database}`
    # `mysqladmin -u#{@username} -p#{@password} drop -f #{@database}` if result.strip == @database
    # `mysqladmin -u#{@username} -p#{@password} create #{@database}`
    `mysql -u#{@username} -p#{@password} #{@database} < #{@filename}`
    # Dir.glob(dump_dir + '*').each do |file|
    #   filename = File.basename(file, '.*')
    # end
  end
end
