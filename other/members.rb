berfore_validatin do
  self.other_job = nil unelss job == "others"
end

validation :other_job, length: { maximumL 10 }, presence: true,
  if: -> { |obj| obj.job == "others" }


OCCUPATIONS = {
1 => 'office', 2 => 'free',
3 => 'office2', 4 => 'student', 5 => 'neet',
0 => 'others' }

@member.job = 3
p @member.job
p @member[:job]

