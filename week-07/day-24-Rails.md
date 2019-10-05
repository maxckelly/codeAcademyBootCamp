## Day 24 - Mark's Notes

## Ruby Review! (with Anhar)

- What is the difference between .each and .map? .each returns the original array. 
- What is .find? If it matches a criterion, it returns the first thing it matches.
```
array = [23, 56, 7, 25]

result = array.find do |num|
	num > 10
end 

p result
```

- What is the difference between .find and .select?
- What does .sort do? By default sorts alphabetically/numerically.
```
fruits_sorted = fruits.sort

fruits.sort do |fruit_a, fruit_b|
	fruit_a.length <=> fruit_b.length
end 

```

- Method scope. Any variables you define inside the block won't be available outside it.
- How to access an instance variable in a class? First, you need to make sure it has a method. Then you can call the method on the object. E.g. `p burger.price`
- `self` makes it a class method rather than an instance method

## Harrison's Yield Lesson

- An optional thing to learn. It's not strictly necessary but good to understand.
- What is yield? A built-in ruby method. 
```
def hello
	name = "harrison"
	yield()
	return name
end 

hello
```
- That will return a 'no block given' error message.
- So we need to know what a block is? Everything from `do` to `end` is a block.
```
def hello
	name = "harrison"
	yield()
	return name
end 

hello do
	puts "hello"
end

```
- Have to give hello a block because I'm using yield.
- Yield is simply saying: going into that do block at this point. 
- Can also pass arguments to yield `yield(5)`. That can then be passed in as an argument in the do block. E.g. `result = hello.do |number|`...
- self represents the actual instance inside of an instance method
```
class Array
	def my_each
		index = 0
		while index < self.length
			puts self[index]
			index += 1
		end
		return self
	end 
end

p [1,2,3].my_each
``` 
- Using yield to make the block instead:
```
result = [1,2,3].my_each do
	puts "hello"
end

p result
```

## Rails review with Aaron (separate class for those who wanted it)

- Going over database relationships.
- It's always the 'child' in the relationship that has the id. So patients have a doctor id rather than doctor having patient id1, patient id2, and so on.
- Many to many? The way to solve it in most instances is to create a third table. For example, create an 'appointments' table in addition to a 'doctors' table and a 'patients' table. So patient belongs to an appointment; doctor belongs to an appointment; appointments has many patients, has many doctors.
- Patient has many doctors through appointments; doctor has many patients through appointments; appointmens has one doctor_id, has one patient_id. Aaron's not sure of the keywords rails uses here. But this is the way to solve the problem, generally speaking.
