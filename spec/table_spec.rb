# frozen_string_literal: true

require './lib/table'

describe Table do
  let(:table) { Table.new(length: 5, width: 5) }

  describe "#valid_position?" do
    let(:x_coord) { 1 }
    let(:y_coord) { 1 }

    it "returns true when x and y coordinates are in the range" do
      expect(table.valid_position?(x_coord: x_coord, y_coord: y_coord)).to be_truthy
    end

    context "when the x coordinate is not in the range" do
      let(:x_coord) { -1 }
      let(:y_coord) { 3 }

      it "returns false" do
      expect(table.valid_position?(x_coord: x_coord, y_coord: y_coord)).to be_falsy
      end
    end

    context "when the y coordinate is not in the range" do
      let(:x_coord) { 2 }
      let(:y_coord) { 8 }

      it "returns false" do
        expect(table.valid_position?(x_coord: x_coord, y_coord: y_coord)).to be_falsy
      end
    end
  end
end
