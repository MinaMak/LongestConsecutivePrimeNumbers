def show_results(max_limit)
    require 'prime'
    results = {}
    primes = Prime.take_while {|p| p < max_limit}
    (0..primes.count).each do |drop_num|
      i = 0
      sum = 0
      primes.drop(drop_num).each do |prime|
        break if sum >= max_limit
        i += 1
        sum += prime
        results[sum] = i if sum < max_limit && (results[sum].blank? || results[sum] < i) && Prime.prime?(sum)
      end
    end
    results.max_by{|_,v| v}
  end
