#ifndef FIX42_RESENDREQUEST_H
#define FIX42_RESENDREQUEST_H

#include "Message.h"

namespace FIX42
{

  class ResendRequest : public Message
  {
  public:
    ResendRequest() : Message(MsgType()) {}
    ResendRequest(const Message& m) : Message(m) {}
    static FIX::MsgType MsgType() { return FIX::MsgType("2"); }

    ResendRequest(
      const FIX::BeginSeqNo& aBeginSeqNo,
      const FIX::EndSeqNo& aEndSeqNo )
    : Message(MsgType())
    {
      set(aBeginSeqNo);
      set(aEndSeqNo);
    }

    FIELD_SET(*this, FIX::BeginSeqNo);
    FIELD_SET(*this, FIX::EndSeqNo);
  };

}

#endif
