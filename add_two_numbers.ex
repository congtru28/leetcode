# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def add_two_numbers(l1, l2) do
    gen_next_node(l1, l2, 0)
  end
  
  defp gen_next_node(n1, n2, carry) when is_nil(n1) and is_nil(n2) and carry == 0, do: nil
  defp gen_next_node(n1, n2, carry) do
    sum = node_val(n1) + node_val(n2) + carry

    %ListNode{val: rem(sum, 10), next: gen_next_node(next_node(n1), next_node(n2), div(sum, 10))}
  end

  defp next_node(n) when is_nil(n), do: nil
  defp next_node(n), do: n.next

  defp node_val(n) when is_nil(n), do: 0
  defp node_val(n), do: n.val
end
