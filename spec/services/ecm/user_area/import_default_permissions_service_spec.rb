require 'rails_helper'

module Ecm::UserArea
  describe ImportDefaultPermissionsService, type: :model do
    it { should be_a(Itsf::Services::V2::Service::Base) }

    it { should respond_to :filename }
    #it { should validate_presence_of :filename }

    describe 'when called without filename' do
      it { expect(subject.send(:do_work).success?).to be_falsey  }
      it { expect(subject.send(:do_work).errors[:filename]).to include("can't be blank")  }
    end

    describe 'when called with a valid file' do
      before(:each) do
        @attributes = {
          filename: Engine.root.join(*%w(spec files ecm user_area import_rbac_service valid_file.yml))
        }
      end

      subject { ImportDefaultPermissionsService.new(@attributes) }

      it { expect(subject.send(:do_work).success?).to be_truthy  }
      it { expect(subject.send(:do_work).errors.messages).to eq({})  }
      it { expect(subject.send(:do_work).permissions.size).to eq(7)  }
      it { expect(subject.send(:do_work).roles.size).to eq(2)  }
      it { expect(subject.send(:do_work).role_permissions.size).to eq(10)  }
      it { expect{ subject.send(:do_work) }.to change{ Ecm::UserArea::Permission.count }.from(0).to(7)  }
      it { expect{ subject.send(:do_work) }.to change{ Ecm::UserArea::Role.count }.from(0).to(2)  }
      it { expect{ subject.send(:do_work) }.to change{ Ecm::UserArea::RolePermission.count }.from(0).to(10)  }
    end
  end
end