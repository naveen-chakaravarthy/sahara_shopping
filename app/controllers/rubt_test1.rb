a = [1,2,3,4,5]

a = a.map! { |x| x}
puts a.map!
puts a.object_id

puts 'abc'.upcase!
puts Proc.new {|n| puts n }

def gen_times(factor)
  Proc.new do |n|
    n*factor
  end # remembers the value of factor at the moment of creation
end

times3 = gen_times(3)
times5 = gen_times(5)

puts times3.call(2)
puts times5.call(2)

p = proc {|x, y| "x=#{x}, y=#{y}" }

