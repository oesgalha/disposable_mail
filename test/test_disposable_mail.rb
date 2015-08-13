require 'test_helper'

class TestDisposableMail < MiniTest::Test
  def test_list
    assert_kind_of Array, DisposableMail.list
    refute_empty DisposableMail.list

    DisposableMail.list.each do |domain|
      assert_kind_of String, domain
      refute_match /[@\s]/, domain
    end
  end

  def test_include
    assert DisposableMail.include? "bot@mailinator.com"
    assert DisposableMail.include? "fake@guerillamail.com"
    assert DisposableMail.include? "johndoe@trashmail.com"

    refute DisposableMail.include? "legit-person@yahoo.com"
    refute DisposableMail.include? "someone@gmail.com"
  end
end
