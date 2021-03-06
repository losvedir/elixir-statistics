defmodule TDistributionTest do
  use ExUnit.Case, async: true
  doctest Statistics.Distributions.T, except: [rand: 0, rand: 3]

  alias Statistics.Distributions.T

  test "output of the pdf function" do
    assert T.pdf(3).(0) == 0.3675525969478612
    assert T.pdf(7).(0.1) == 0.38279933426055135
    assert T.pdf(77).(0.1) == 0.39564030492250557
  end

  test "return a cdf " do
    assert T.cdf(3).(2) == 0.9115868129912105
    # assert T.cdf(0, 1) == 0.48740751602180743 # ~ 0.5
  end

  test "return a random number from the distribution" do
    assert is_float(T.rand(2))
    # rands = for _ <- 0..10000, do: T.rand(3)
    # assert T.rand(77) == 0.5
  end

  @tag timeout: 120_000
  test "get the percentile point value" do
    assert T.ppf(1).(0.1) == -3.0799999999999996
  end
end
