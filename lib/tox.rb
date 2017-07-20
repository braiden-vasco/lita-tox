# frozen_string_literal: true

# lita-tox - Tox adapter for the Lita chat bot
# Copyright (C) 2015-2017  Braiden Vasco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# rubocop:disable Layout/SpaceInsideArrayPercentLiteral

require 'tox/tox'

class Tox # rubocop:disable Style/Documentation
  NODES = [
    %w[192.254.75.102  33445 951C88B7E75C867418ACDB5D273821372BB5BD652740BCDF623A4FA293E75D2F],
    %w[144.76.60.215   33445 04119E835DF3E78BACF0F84235B300546AF8B936F035185E2A8E9E0A67C8924F],
    %w[23.226.230.47   33445 A09162D68618E742FFBCA1C2C70385E6679604B2D80EA6E84AD0996A1AC8A074],
    %w[178.62.125.224  33445 10B20C49ACBD968D7C80F2E8438F92EA51F189F4E70CFBBB2C2C8C799E97F03E],
    %w[178.21.112.187  33445 4B2C19E924972CB9B57732FB172F8A8604DE13EEDA2A6234E348983344B23057],
    %w[195.154.119.113 33445 E398A69646B8CEACA9F0B84F553726C1C49270558C57DF5F3C368F05A7D71354],
    %w[192.210.149.121 33445 F404ABAA1C99A9D37D61AB54898F56793E1DEF8BD46B1038B9D822E8460FAB67],
    %w[76.191.23.96    33445 93574A3FAB7D612FEA29FD8D67D3DD10DFD07A075A5D62E8AF3DD9F5D0932E11],
    %w[46.38.239.179   33445 F5A1A38EFB6BD3C2C8AF8B10D85F0F89E931704D349F1D0720C3C4059AF2440A],
    %w[178.62.250.138  33445 788236D34978D1D5BD822F0A5BEBD2C53C64CC31CD3149350EE27D4D9A2F9B6B],
    %w[78.225.128.39   33445 7A2306BFBA665E5480AE59B31E116BE9C04DCEFE04D9FE25082316FA34B4DA0C],
    %w[130.133.110.14  33445 461FA3776EF0FA655F1A05477DF1B3B614F7D6B124F7DB1DD4FE3C08B03B640F],
    %w[104.167.101.29  33445 5918AC3C06955962A75AD7DF4F80A5D7C34F7DB9E1498D2E0495DE35B3FE8A57],
    %w[195.154.109.148 33445 391C96CB67AE893D4782B8E4495EB9D89CF1031F48460C06075AA8CE76D50A21],
    %w[192.3.173.88    33445 3E1FFDEB667BFF549F619EC6737834762124F50A89C8D0DBF1DDF64A2DD6CD1B],
    %w[205.185.116.116 33445 A179B09749AC826FF01F37A9613F6B57118AE014D4196A0E1105A98F93A54702],
    %w[198.98.51.198   33445 1D5A5F2F5D6233058BF0259B09622FB40B482E4FA0931EB8FD3AB8E7BF7DAF6F],
    %w[80.232.246.79   33445 A7A060D553B017D9D8F038E265C7AFB6C70BAAC55070197F9C007432D0038E0F],
    %w[108.61.165.198  33445 8E7D0B859922EF569298B4D261A8CCB5FEA14FB91ED412A7603A585A25698832],
    %w[212.71.252.109  33445 C4CEB8C7AC607C6B374E2E782B3C00EA3A63B80D4910B8649CCACDD19F260819],
    %w[194.249.212.109 33445 3CEE1F054081E7A011234883BC4FC39F661A55B73637A5AC293DDF1251D9432B],
    %w[194.249.212.109 443   3CEE1F054081E7A011234883BC4FC39F661A55B73637A5AC293DDF1251D9432B],
    %w[103.38.216.87   33445 601AEE6FC8C17E8CD8F8F1FFC4D4AD84E59A73BE451F037194E7A404E3795320],
    %w[185.25.116.107  33445 DA4E4ED4B697F2E9B000EEFE3A34B554ACD3F45F5C96EAEA2516DD7FF9AF7B43],
    %w[192.99.168.140  33445 6A4D0607A296838434A6A7DDF99F50EF9D60A2C510BBF31FE538A25CB6B4652F],
  ].freeze

  attr_accessor :running

  def initialize(options = Tox::Options.new)
    initialize_with(options)

    NODES.each do |node|
      bootstrap(
        ip: node[0],
        port: node[1].to_i,
        key: node[2],
      )
    end
  end

  def on_friend_request(&block)
    @on_friend_request = block
  end

  def on_friend_message(&block)
    @on_friend_message = block
  end
end
