require 'minitest/autorun'
require 'minitest/benchmark'
require 'minitest/pride'
require 'disposable_mail'

class TestDisposableMail < MiniTest::Test
  def test_list
    assert_kind_of Set, DisposableMail.list
    refute_empty DisposableMail.list

    DisposableMail.list.each do |domain|
      assert_kind_of String, domain
      refute_match /[@\s]/, domain
    end
  end

  def test_include
    DisposableMail.list.each do |domain|
      assert DisposableMail.include? "bot@#{domain}"
    end

    refute DisposableMail.include? "legit-person@yahoo.com"
    refute DisposableMail.include? "someone@gmail.com"
    refute DisposableMail.include? "gmail.com"
    refute DisposableMail.include? "yopmail.com"
    refute DisposableMail.include? ""
    refute DisposableMail.include? nil
  end

  def test_custom_list
    refute DisposableMail.include? "legit@yahoo.com"
    DisposableMail.list << "yahoo.com"
    assert DisposableMail.include? "legit@yahoo.com"
    DisposableMail.list.delete "yahoo.com"
    refute DisposableMail.include? "legit@yahoo.com"
  end

  def test_subdomains
    assert DisposableMail.include? "email@test.yopmail.com"
    assert DisposableMail.include? "email@yop.test.yopmail.com"
    assert DisposableMail.include? "email@farrse.co.uk"
    refute DisposableMail.include? "email@gmail.co.uk"
    refute DisposableMail.include? "email@yopmail.com.gmail.fr"
  end
end
