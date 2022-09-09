using BillSplitter.ViewModels;
using System.ComponentModel;
using Xamarin.Forms;

namespace BillSplitter.Views
{
    public partial class ItemDetailPage : ContentPage
    {
        public ItemDetailPage()
        {
            InitializeComponent();
            BindingContext = new ItemDetailViewModel();
        }
    }
}