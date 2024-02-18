# frozen_string_literal: true

require './lib/robot'

describe Robot do
  let(:x_coord) { 1 }
  let(:y_coord) { 1 }
  let(:direction) { "NORTH" }
  let(:robot) { Robot.new(x_coord: x_coord, y_coord: y_coord, direction: direction) }

  describe "#move" do
    context "when the direction is NORTH" do
      it "increases the y coordinate" do
        robot.move

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord)
        expect(report[:y_coord]).to eq(y_coord + 1)
        expect(report[:direction]).to eq(direction)
      end
    end

    context "when the direction is SOUTH" do
      let(:direction) { "SOUTH" }

      it "decreases the y coordinate" do
        robot.move

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord)
        expect(report[:y_coord]).to eq(y_coord - 1)
        expect(report[:direction]).to eq(direction)
      end
    end

    context "when the direction is EAST" do
      let(:direction) { "EAST" }

      it "increases the x coordinate" do
        robot.move

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord + 1)
        expect(report[:y_coord]).to eq(y_coord)
        expect(report[:direction]).to eq(direction)
      end
    end

    context "when the direction is WEST" do
      let(:direction) { "WEST" }

      it "decreases the x coordinate" do
        robot.move

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord - 1)
        expect(report[:y_coord]).to eq(y_coord)
        expect(report[:direction]).to eq(direction)
      end
    end
  end

  describe "#report" do
    it "returns the current data of the robot" do
      report = robot.report

      expect(report[:x_coord]).to eq(x_coord)
      expect(report[:y_coord]).to eq(y_coord)
      expect(report[:direction]).to eq(direction)
    end
  end

  describe "#left" do
    context "when the direction is NORTH" do
      it "changes the direction" do
        robot.left

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord)
        expect(report[:y_coord]).to eq(y_coord)
        expect(report[:direction]).to eq("WEST")
      end
    end

    context "when the direction is SOUTH" do
      let(:direction) { "SOUTH" }

      it "changes the direction" do
        robot.left

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord)
        expect(report[:y_coord]).to eq(y_coord)
        expect(report[:direction]).to eq("EAST")
      end
    end
  end

  describe "#right" do
    context "when the direction is EAST" do
      let(:direction) { "EAST" }

      it "changes the direction" do
        robot.right

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord)
        expect(report[:y_coord]).to eq(y_coord)
        expect(report[:direction]).to eq("SOUTH")
      end
    end

    context "when the direction is WEST" do
      let(:direction) { "WEST" }

      it "decreases the x coordinate" do
        robot.right

        report = robot.report

        expect(report[:x_coord]).to eq(x_coord)
        expect(report[:y_coord]).to eq(y_coord)
        expect(report[:direction]).to eq("NORTH")
      end
    end
  end
end
