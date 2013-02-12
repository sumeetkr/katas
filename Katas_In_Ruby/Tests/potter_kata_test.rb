require "test/unit"
require "../Katas/potter_kata"

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    assert_equal(0, PotterKata.price([]))
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

#  def testBasics
#    assert_equal(0, PotterKata.price([]))
#    assert_equal(8, PotterKata.price([0]))
#    assert_equal(8, PotterKata.price([1]))
#    assert_equal(8, PotterKata.price([2]))
#    assert_equal(8, PotterKata.price([3]))
#    assert_equal(8, PotterKata.price([4]))
#    assert_equal(8 * 2, PotterKata.price([0, 0]))
#    assert_equal(8 * 3, PotterKata.price([1, 1, 1]))
#  end
#
#  def testSimpleDiscounts
#    assert_equal(8 * 2 * 0.95, PotterKata.price([0, 1]))
#    assert_equal(8 * 3 * 0.9, PotterKata.price([0, 2, 4]))
#    assert_equal(8 * 4 * 0.8, PotterKata.price([0, 1, 2, 4]))
#    assert_equal(8 * 5 * 0.75, PotterKata.price([0, 1, 2, 3, 4]))
#  end
#
#  def testSeveralDiscounts
#    assert_equal(8 + (8 * 2 * 0.95), PotterKata.price([0, 0, 1]))
#    assert_equal(2 * (8 * 2 * 0.95), PotterKata.price([0, 0, 1, 1]))
#    assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), PotterKata.price([0, 0, 1, 2, 2, 3]))
#    assert_equal(8 + (8 * 5 * 0.75), PotterKata.price([0, 1, 1, 2, 3, 4]))
#  end
#
#  def testEdgeCases
#    assert_equal(2 * (8 * 4 * 0.8), PotterKata.price([0, 0, 1, 1, 2, 2, 3, 4]))
#    assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
#                 PotterKata.price([0, 0, 0, 0, 0,
#                        1, 1, 1, 1, 1,
#                        2, 2, 2, 2,
#                        3, 3, 3, 3, 3,
#                        4, 4, 4, 4]))
#  end
end