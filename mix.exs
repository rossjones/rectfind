defmodule Rectfind.Mixfile do
  use Mix.Project

  def project do
    [app: :rectfind,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:ex_csv, "~> 0.1.3"}]
  end
end
