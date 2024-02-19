# frozen_string_literal: true

require './lib/command_parser'
require './lib/table'
require './lib/robot'

describe CommandParser do
  let(:table) { Table.new(length: 5, width: 5) }
  let(:command_parser) { CommandParser.new(table: table) }

  describe "#parse" do
    context "when the command is PLACE" do
      it "places robot into the valid position" do
        expect(Robot).to receive(:new).with(x_coord: 0, y_coord: 0, direction: "NORTH")

        command_parser.parse("PLACE 0,0,NORTH")
      end

      context "and the direction is invalid" do
        it "raises an InvalidCommandError" do
          expect{ command_parser.parse("PLACE 0,0,INV") }.to raise_error InvalidCommandError
        end
      end

      context "and the location is invalid" do
        it "raises an InvalidLocationError" do
          expect{ command_parser.parse("PLACE 7,7,WEST") }.to raise_error InvalidLocationError
        end
      end
    end

    context "when the command is MOVE" do
      context "and the robot is not placed yet" do
        it "does not raise any error" do
          expect { command_parser.parse("MOVE") }.to_not raise_error
        end
      end

      context "and the robot is placed" do
        let(:robot) { instance_double(Robot) }
          before do
            allow(Robot).to receive(:new).and_return(robot)
            command_parser.parse("PLACE 0,0,NORTH")
          end

        context "and when the next move is invalid location" do
          before do
            allow(robot).to receive(:next_move).and_return([6,6])
          end

          it "does not raise an error" do
            expect { command_parser.parse("MOVE") }.to_not raise_error
          end

          it "does not tell robot to move" do
            expect(robot).to_not receive(:move)

            command_parser.parse("MOVE")
          end
        end

        context "and when the next move is valid location" do
          before do
            allow(robot).to receive(:next_move).and_return([1,1])
          end

          it "does tells robot to move" do
            expect(robot).to receive(:move)

            command_parser.parse("MOVE")
          end
        end
      end
    end

    context "when the command is LEFT" do
      context "and the robot is placed" do
        let(:robot) { instance_double(Robot) }

        before do
          allow(Robot).to receive(:new).and_return(robot)
          command_parser.parse("PLACE 0,0,NORTH")
        end

        it "tells robot to turn left" do
          expect(robot).to receive(:left)

          command_parser.parse("LEFT")
        end
      end

      context "and the robot is not placed yet" do
        it "does not raise any error" do
          expect { command_parser.parse("LEFT") }.to_not raise_error
        end
      end
    end

    context "when the command is RIGHT" do
      context "and the robot is placed" do
        let(:robot) { instance_double(Robot) }

        before do
          allow(Robot).to receive(:new).and_return(robot)
          command_parser.parse("PLACE 0,0,NORTH")
        end

        it "tells robot to turn right" do
          expect(robot).to receive(:right)

          command_parser.parse("RIGHT")
        end
      end

      context "and the robot is not placed yet" do
        it "does not raise any error" do
          expect { command_parser.parse("RIGHT") }.to_not raise_error
        end
      end
    end

    context "when the comamnd is REPOT" do
      context "and the robot is placed" do
        let(:robot) { instance_double(Robot) }
        let(:report) do
          {
            x_coord: 0,
            y_coord: 0,
            direction: "NORTH"
          }
        end

        before do
          allow(Robot).to receive(:new).and_return(robot)
          command_parser.parse("PLACE 0,0,NORTH")
        end

        it "tells robot to report" do
          expect(robot).to receive(:report).and_return(report)

          command_parser.parse("REPORT")
        end
      end

      context "and the robot is not placed yet" do
        it "does not raise any error" do
          expect { command_parser.parse("REPORT") }.to_not raise_error
        end
      end
    end

    context "when the command is invalid" do
      it "raises an InvalidCommandError" do
        expect{ command_parser.parse("invalid") }.to raise_error InvalidCommandError
      end
    end
  end
end
